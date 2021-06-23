import 'dart:io';

import 'package:emulators/emulators.dart' as emu;

Future<void> main() async {
  // This creates a config object, which contains the paths to cli tools.
  // You can set custom paths using `copyWith`.
  final config = (await emu.buildConfig()).copyWith(
    adbPath: 'custom/path/to/bin/adb',
  );

  // Create a screenshot helper function.
  // `writeScreenshot` will take a screenshot using adb or xcrun simctl, and
  // write it to the directory for it's platform.
  final screenshot = emu.writeScreenshot(config)(
    androidPath: 'directory/for/android/screenshots',
    iosPath: 'directory/for/ios/screenshots',
  );

  // This will try to sequentially launch the given devices, running the given
  // function on each one.
  await emu.forEach(config)([
    'iPhone 8 Plus',
    'iPhone 12 Pro',
    'Nexus_5X',
  ])((device) async {
    // Take a screenshot and write it to a file
    await screenshot(device)('home_screen');
  });
}
