import 'package:emulators/src/device/platforms/android.dart' as android;
import 'package:emulators/src/device/device_error.dart';
import 'package:emulators/src/device/device_state.dart';
import 'package:emulators/src/device/platforms/ios.dart' as ios;
import 'package:emulators/src/device/utils.dart';
import 'package:emulators/src/flutter.dart' as flutter;
import 'package:emulators/src/toolchain.dart';
import 'package:fpdt/either.dart' as E;
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:fpdt/reader_task_either.dart' as RTE;
import 'package:fpdt/state_reader_task_either.dart' as SRTE;
import 'package:fpdt/task_either.dart' as TE;

export 'package:emulators/src/device/device_error.dart';
export 'package:emulators/src/device/device_state.dart';

/// Wraps [DeviceState] and [Toolchain]
class Device {
  Device({
    required DeviceState state,
    required Toolchain toolchain,
  }) : _s = StateRTEMachine(state, toolchain);

  final StateRTEMachine<DeviceState, Toolchain, DeviceError> _s;
  DeviceState get state => _s.state;
  Toolchain get toolchain => _s.context;

  Future<T> _run<T>(DeviceOp<T> op) => _s.evaluate(op).then(E.unwrap);

  /// Boot the device
  Future<void> boot() => _run(bootOp);

  /// Shutdown the device
  Future<void> shutdown() => _run(shutdownOp);

  /// Clean the status bar for screenshots
  Future<void> cleanStatusBar() => _run(cleanStatusBarOp);

  /// Take a screenshot of the device
  Future<List<int>> screenshot() => _run(screenshotOp);

  /// Maybe map the device id back to the device name
  Future<void> maybeResolveName() => _run(maybeResolveNameOp);

  /// Returns true if the device is similar to the given [DeviceState].
  bool similar(DeviceState other) => state.similar(other);

  /// Waits until the [Device] is running, or errors with a timeout.
  Future<void> waitUntilRunning({
    Duration timeout = const Duration(seconds: 100),
  }) =>
      _run(waitUntilRunningOp).timeout(timeout);

  Device clone() => Device(state: state, toolchain: toolchain);
}

// ==== Operations
final listOp = RTE.sequence([
  android.list,
  ios.list,
]).p(RTE.map((l) => l.expand<Device>(identity).toIList()));

typedef ProcessDevice = Future<void> Function(Device);
final _forEachDevice =
    (ProcessDevice process, Duration timeout) => (Device d) => TE
            .tryCatch(
              () => d.boot().then((_) => d.clone()),
              (err, stackTrace) => DeviceError.foreachFailure(
                phase: 'boot',
                message: err.toString(),
              ),
            )
            .p(TE.flatMapFirst(TE.tryCatchK(
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
              ),
            )))
            .p(TE.alt((err) {
          print("Error processing device ${d.state.name}: $err");
          return TE.right(d);
        }));

final forEachOp = ({
  required ProcessDevice process,
  required List<String> nameOrIds,
  Duration timeout = const Duration(minutes: 3),
}) =>
    listOp
        .p(RTE.flatMapTaskEither(
          (devices) => devices
              .where((d) =>
                  nameOrIds.contains(d.state.id) ||
                  nameOrIds.contains(d.state.name))
              .map(_forEachDevice(process, timeout))
              .p(TE.sequenceSeq),
        ))
        .p(RTE.map((_) => unit));

final bootOp = op(
  android: android.boot,
  ios: ios.boot,
);

final shutdownOp = op(
  android: android.shutdown,
  ios: ios.screenshot,
);

final shutdownAllOp = flutter
    .running()
    .p(RTE.mapLeft((l) => DeviceError.flutterFailure(
          op: 'shutdownAll',
          command: 'running',
          message: l.message,
        )))
    .p(RTE.flatMap(
      (devices) => devices.map((d) => shutdownOp(d.state)).p(RTE.sequence),
    ))
    .p(RTE.map((_) => unit));

final cleanStatusBarOp = op(
  android: android.cleanStatusBar,
  ios: ios.cleanStatusBar,
);

final screenshotOp = op(
  android: android.screenshot,
  ios: ios.screenshot,
);

final maybeResolveNameOp = op(
  android: android.maybeResolveName,
  ios: ios.maybeResolveName,
);

final findRunning = (DeviceState s) => flutter
    .running()
    .p(RTE.map((devices) => devices.firstWhereOption((d) => d.similar(s))))
    .p(RTE.mapLeft((l) => DeviceError.flutterFailure(
          op: 'isRunning',
          command: 'running',
          message: l.message,
        )));

final DeviceOp<void> waitUntilRunningOp =
    opAsk().p(SRTE.flatMapR((a) => findRunning)).p(SRTE.flatMap(O.fold(
          () => opAsk()
              .p(SRTE.delay(Duration(seconds: 2)))
              .p(SRTE.flatMap((a) => waitUntilRunningOp)),
          (running) => SRTE.put(running.state),
        )));
