library emulators;

import "package:emulators/src/platforms/android.dart" as android;
import "package:emulators/src/platforms/ios.dart" as ios;

export 'src/config.dart';
export 'src/devices.dart';
export 'src/flutter.dart';
export 'src/models/device.dart';

/// Wrapper for the `adb` CLI tool
final adb = android.adb;

/// Wrapper for the `avdmanager` CLI tool from the Android SDK
final avdmanager = android.avdmanager;

/// Wrapper for the `emulator` CLI tool from the Android SDK
final emulator = android.emulator;

/// Wrapper for the `xcrun simctl` CLI tool
final simctl = ios.simctl;
