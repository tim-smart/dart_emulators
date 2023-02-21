import 'package:elemental/elemental.dart';
import 'package:emulators/emulators.dart';
import 'package:emulators/src/device.dart';
import 'package:emulators/src/device/platforms/android.dart' as android;
import 'package:emulators/src/device/platforms/ios.dart' as ios;
import 'package:emulators/src/device/utils.dart';
import 'package:emulators/src/flutter.dart' as flutter;

typedef ToolchainIO<A> = ZIO<Toolchain, DeviceError, A>;

final list = [
  android.list.logOrElse(IList()),
  ios.list.logOrElse(IList()),
].collectPar().map((l) => l.expand<Device>(identity).toIList());

// == forEach
typedef ProcessDevice = Future<void> Function(Device);

final _findDevice = (IList<Device> devices, String nameOrId) => devices
    .where((d) => d.state.id == nameOrId || d.state.name == nameOrId)
    .firstOption
    .toZIOOrFail(() => DeviceError.foreachFailure(
          phase: '_findDevice',
          message: 'Could not find device: $nameOrId',
        ));

final _processDevice =
    (ProcessDevice process, Duration timeout) => (Device d) => ZIO
            .tryCatch(
          () => d.boot().then((_) => d.clone()),
          (err, stackTrace) => DeviceError.foreachFailure(
            phase: 'boot',
            message: err.toString(),
            device: d.state,
          ),
        )
            .flatMapThrowable(
          (booted) async {
            try {
              await d.waitUntilRunning(timeout: timeout);
              await process(d);
            } finally {
              await booted.shutdown();
            }
          },
          (err, stackTrace) => DeviceError.foreachFailure(
            phase: 'process',
            message: err.toString(),
            device: d.state,
          ),
        ).asUnit;

final forEach = ({
  required ProcessDevice process,
  required Iterable<String> nameOrIds,
  Duration timeout = const Duration(minutes: 3),
}) =>
    list.flatMap(
      (devices) => nameOrIds
          .map(
            (d) => _findDevice(devices, d)
                .flatMap(_processDevice(process, timeout))
                .ignoreLogged,
          )
          .collectDiscard()
          .lift(),
    );

final boot = platformOp(
  android: android.boot,
  ios: ios.boot,
);

final shutdown = platformOp(
  android: android.shutdown,
  ios: ios.shutdown,
);

final shutdownAll = flutter
    .running()
    .mapError((l) => DeviceError.flutterFailure(
          op: 'shutdownAll',
          error: l,
        ))
    .flatMap((devices) => devices
        .map((d) => shutdown.provide(d.unsafeEnv))
        .collectParDiscard()
        .lift());

final cleanStatusBar = platformOp(
  android: android.cleanStatusBar,
  ios: ios.cleanStatusBar,
);

final screenshot = platformOp(
  android: android.screenshot,
  ios: ios.screenshot,
);

final maybeResolveName = platformOp(
  android: android.maybeResolveName,
  ios: ios.maybeResolveName,
);

final findRunning = (DeviceState s) => flutter
    .running()
    .map((devices) => Option.fromNullable(devices.firstOrNull))
    .mapError((l) => DeviceError.flutterFailure(
          op: 'isRunning',
          error: l,
        ));

final DeviceIO<Unit> waitUntilRunning = DeviceIO.envWithZIO(
  (env) => findRunning(env.state).provide(env.toolchain).lift(),
).flatMapEnv(
  (_, env) => _.match(
    () => waitUntilRunning.delay(const Duration(seconds: 2)),
    (running) => env.ref.set(running.state).lift(),
  ),
);
