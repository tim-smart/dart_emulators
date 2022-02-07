import 'dart:io';

import 'package:emulators/emulators.dart';

Future<void> main() async {
  final emu = await Emulators.build();

  // Shutdown all running devices
  await emu.shutdownAll();

  // Use the adb / avdmanager / emulator / simctl helpers
  await emu.toolchain.emulator(['-list-avds']).string();

  await emu.toolchain.avdmanager([
    'create',
    'avd',
    '-n',
    'Nexus_5X',
    '-k',
    'system-images;android-25;google_apis;x86',
    '-f',
  ]).string();

  // This will try to sequentially launch the given devices, running the given
  // function on each one.
  await emu.forEach([
    'iPhone 8 Plus',
    'iPhone 12 Pro',
    'Nexus_5X',
  ])((device) async {
    // Create a screenshot helper.
    final screenshot = emu.screenshotHelper(
      device: device,
      androidPath: 'directory/for/android/screenshots',
      iosPath: 'directory/for/ios/screenshots',
    );

    // Take a screenshot and write it to a file
    await screenshot.capture('home_screen');

    // Or you can run flutter drive, and send the output to stdout
    final process = await emu.flutter.drive(device, 'test_driver/main.dart');
    await stdout.addStream(process.stdout);
  });
}
