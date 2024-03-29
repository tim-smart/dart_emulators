import 'dart:io';

import 'package:emulators/src/device.dart';
import 'package:path/path.dart' as path;

class ScreenshotHelper {
  const ScreenshotHelper({
    required this.device,
    required this.androidPath,
    required this.iosPath,
    this.suffixes = const [],
  });

  final Device? device;
  final String androidPath;
  final String iosPath;
  final List<String> suffixes;

  Future<void> cleanStatusBar() => device?.cleanStatusBar() ?? Future.value();

  Future<void> capture(String name) async {
    if (device == null) return;

    final image = await device!.screenshot();
    final file = [device!.state.name, ...suffixes, '$name.png'].join('_');
    final basePath =
        device!.state.platform == DevicePlatform.ios ? iosPath : androidPath;
    final filePath = path.join(basePath, file);

    await Directory(basePath).create(recursive: true);
    await File(filePath).writeAsBytes(image);
  }
}
