import 'dart:io';

import 'package:emulators/src/device_state.dart';
import 'package:emulators/src/flutter.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:emulators/src/utils/strings.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:rxdart/rxdart.dart';

part 'device/android.dart';
part 'device/ios.dart';

abstract class DeviceManager {
  /// Get a list of the available emulators
  Stream<Device> list();
}

abstract class Device {
  Device({
    required DeviceState state,
    required Toolchain toolchain,
  })  : _state = state,
        _toolchain = toolchain;

  factory Device.fromState(
    DeviceState state, {
    required Toolchain toolchain,
  }) {
    switch (state.platform) {
      case DevicePlatform.android:
        return AndroidDevice(state: state, toolchain: toolchain);

      case DevicePlatform.ios:
        return IosDevice(state: state, toolchain: toolchain);

      default:
        throw UnimplementedError();
    }
  }

  final Toolchain _toolchain;
  late final flutter = Flutter(_toolchain);

  DeviceState _state;
  DeviceState get state => _state;

  /// Boot the devices
  Future<void> boot();

  /// Shutdown the devices
  Future<void> shutdown();

  /// Clean the status bar for screenshots
  Future<void> cleanStatusBar();

  /// Take a screenshot of the device
  Future<List<int>> screenshot();

  /// Maybe map the device id back to the device name
  Future<void> maybeResolveName() async {}

  /// Returns true if the device is similar to the given [Device].
  bool similar(Device other) => state.similar(other.state);

  /// Waits until the [Device] is running, or errors with a timeout.
  Future<void> waitUntilRunning({
    Duration timeout = const Duration(seconds: 100),
  }) async {
    final match = await Rx.merge([
      Stream.value(null),
      Stream.periodic(Duration(seconds: 1)),
    ])
        .exhaustMap((_) => flutter.running())
        .where((d) => d.similar(this))
        .first
        .timeout(timeout);

    _state = match.state;
  }

  Device clone() => Device.fromState(state, toolchain: _toolchain);
}
