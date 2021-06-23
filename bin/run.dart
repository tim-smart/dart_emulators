import 'dart:io';

import 'package:emulators/emulators.dart' as emu;

Future<void> main() async {
  final config = await emu.buildConfig();

  await emu.forEach(config)([
    'Nexus_5X',
    'iPhone 12 Pro',
  ])((device) async {
    final image = await emu.screenshot(config)(device);
    print(device);
    print(image.length);
    await File('${device.id}.png').writeAsBytes(image);
  });
}
