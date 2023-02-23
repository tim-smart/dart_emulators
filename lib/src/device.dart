import 'package:elemental/elemental.dart';
import 'package:emulators/emulators.dart';
import 'package:emulators/src/device/platform_device.dart';
import 'package:emulators/src/flutter.dart';

export 'package:emulators/src/device/device_error.dart';
export 'package:emulators/src/device/device_state.dart';

/// Wraps [DeviceState] and [Toolchain], providing an interface to control devices.
class Device {
  Device({
    required DeviceState state,
    required this.toolchain,
  }) {
    switch (state.platform) {
      case DevicePlatform.android:
        platform = AndroidDevice(
          state: state,
          toolchain: toolchain,
        );
        break;

      case DevicePlatform.ios:
        platform = IosDevice(
          toolchain: toolchain,
          state: state,
        );
        break;

      case DevicePlatform.unimplemented:
        platform = UnimplementedDevice(state: state);
        break;
    }
  }

  final Toolchain toolchain;
  late final PlatformDevice platform;

  DeviceState get state => platform.state;

  /// Boot the device
  Future<void> boot() => platform.boot.runFutureOrThrow();

  /// Shutdown the device
  Future<void> shutdown() => platform.shutdown.runFutureOrThrow();

  /// Clean the status bar for screenshots
  Future<void> cleanStatusBar() => platform.cleanStatusBar.runFutureOrThrow();

  /// Take a screenshot of the device
  Future<List<int>> screenshot() => platform.screenshot.runFutureOrThrow();

  /// Maybe map the device id back to the device name
  Future<void> maybeResolveName() =>
      platform.maybeResolveName.runFutureOrThrow();

  /// Returns true if the device is similar to the given [DeviceState].
  bool similar(DeviceState other) => state.similar(other);

  /// Waits until the [Device] is running, or errors with a timeout.
  Future<void> waitUntilRunning({
    Duration timeout = const Duration(seconds: 100),
  }) =>
      PlatformDevice.waitUntilRunning(platform)
          .provide(toolchain)
          .runFutureOrThrow()
          .timeout(timeout);

  Device clone([DeviceState Function(DeviceState s)? modifyState]) => Device(
        state: modifyState?.call(state) ?? state,
        toolchain: toolchain,
      );

  static final list = [
    AndroidDevice.list.logOrElse((_) => IList()),
    IosDevice.list.logOrElse((_) => IList()),
  ].collectPar.map((l) => l.expand<Device>(identity).toIList());

  static final shutdownAll = ToolchainIO.envWithZIO(
    (env) => Flutter(env).running().mapError(
          (_) => DeviceError.flutterFailure(
            op: 'shutdownAll',
            error: _,
          ),
        ),
  ).flatMap((_) => _.map((d) => d.platform.shutdown).collectDiscard.lift());

  static RIO<Toolchain, Unit> forEach({
    required Future<void> Function(Device device) process,
    required Iterable<String> nameOrIds,
    Duration timeout = const Duration(minutes: 3),
  }) =>
      list.flatMap(
        (devices) => nameOrIds
            .map(
              (d) => _findDevice(devices, d)
                  .flatMap((_) => _processDevice(_, process, timeout))
                  .ignoreLogged,
            )
            .collectDiscard
            .lift(),
      );
}

// == forEach helpers
final _findDevice = (IList<Device> devices, String nameOrId) => devices
    .where((d) => d.state.id == nameOrId || d.state.name == nameOrId)
    .firstOption
    .toZIOOrFail(() => DeviceError.foreachFailure(
          phase: '_findDevice',
          message: 'Could not find device: $nameOrId',
        ));

DeviceIO<Unit> _processDevice(
  Device device,
  Future<void> Function(Device device) process,
  Duration timeout,
) =>
    device.platform.boot
        .acquireRelease((_) => device.clone().platform.shutdown.ignoreLogged)
        .zipLeft(
          PlatformDevice.waitUntilRunning(device.platform)
              .provide(device.toolchain)
              .lift(),
        )
        .flatMapThrowable(
          (_) => process(device),
          (err, stackTrace) => DeviceError.foreachFailure(
            phase: 'process',
            message: err.toString(),
            device: device.state,
          ),
        )
        .scoped
        .asUnit;
