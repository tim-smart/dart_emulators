import 'package:elemental/elemental.dart';
import 'package:emulators/src/device/device_error.dart';
import 'package:emulators/src/device/device_state.dart';
import 'package:emulators/src/device/ops.dart' as Ops;
import 'package:emulators/src/toolchain.dart';

export 'package:emulators/src/device/device_error.dart';
export 'package:emulators/src/device/device_state.dart';

typedef DeviceIO<A> = ZIO<DeviceEnv, DeviceError, A>;

class DeviceEnv {
  DeviceEnv({
    required this.ref,
    required this.toolchain,
  });

  final Ref<DeviceState> ref;
  final Toolchain toolchain;

  DeviceState get state => ref.unsafeGet();
  String get id => state.id;
}

/// Wraps [DeviceState] and [Toolchain], providing an interface to control devices.
class Device {
  Device({
    required DeviceState state,
    required Toolchain toolchain,
  }) : unsafeEnv = DeviceEnv(
          ref: Ref.unsafeMake(state),
          toolchain: toolchain,
        );

  final DeviceEnv unsafeEnv;
  DeviceState get state => unsafeEnv.state;
  Toolchain get toolchain => unsafeEnv.toolchain;

  Future<T> _run<T>(DeviceIO<T> op) => op.provide(unsafeEnv).runFuture();

  /// Boot the device
  Future<void> boot() => _run(Ops.boot);

  /// Shutdown the device
  Future<void> shutdown() => _run(Ops.shutdown);

  /// Clean the status bar for screenshots
  Future<void> cleanStatusBar() => _run(Ops.cleanStatusBar);

  /// Take a screenshot of the device
  Future<List<int>> screenshot() => _run(Ops.screenshot);

  /// Maybe map the device id back to the device name
  Future<void> maybeResolveName() => _run(Ops.maybeResolveName);

  /// Returns true if the device is similar to the given [DeviceState].
  bool similar(DeviceState other) => state.similar(other);

  /// Waits until the [Device] is running, or errors with a timeout.
  Future<void> waitUntilRunning({
    Duration timeout = const Duration(seconds: 100),
  }) =>
      _run(Ops.waitUntilRunning).timeout(timeout);

  Device clone([DeviceState Function(DeviceState s)? modifyState]) => Device(
        state: modifyState?.call(state) ?? state,
        toolchain: toolchain,
      );
}
