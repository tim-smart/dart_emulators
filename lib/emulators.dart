library emulators;

import "package:emulators/src/platforms/android.dart" as android;
import "package:emulators/src/platforms/ios.dart" as ios;

export 'src/config.dart';
export 'src/devices.dart';
export 'src/flutter.dart';
export 'src/models/device.dart';

final adb = android.adb;
final avdmanager = android.avdmanager;
final emulator = android.emulator;
final simctl = ios.simctl;
