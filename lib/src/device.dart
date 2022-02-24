import 'package:emulators/src/device/device_error.dart';
import 'package:emulators/src/device/device_state.dart';
import 'package:emulators/src/device/ops.dart' as Ops;
import 'package:emulators/src/device/utils.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:fpdt/either.dart' as E;
import 'package:fpdt/fpdt.dart';

export 'package:emulators/src/device/device_error.dart';
export 'package:emulators/src/device/device_state.dart';

/// Wraps [DeviceState] and [Toolchain], providing an interface to control devices.
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

  Device clone() => Device(state: state, toolchain: toolchain);
}
