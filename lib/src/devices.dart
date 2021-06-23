import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart' hide Kind;
import 'package:emulators/src/config.dart' as c;
import 'package:emulators/src/platforms/android.dart' as android;
import 'package:emulators/src/platforms/ios.dart' as ios;
import 'package:emulators/src/flutter.dart' as flutter;
import 'package:emulators/src/models/device.dart';

Future<List<Device>> list(c.Config config) => Future.wait([
      android.list(config),
      ios.list(config),
    ]).then((results) => results.expand((i) => i).toList());

Future<Device> Function(Device) boot(c.Config config) =>
    (device) => device.platform == DevicePlatform.IOS
        ? ios.boot(config)(device)
        : android.boot(config)(device);

Future<void> Function(Device) shutdown(c.Config config) =>
    (device) => device.platform == DevicePlatform.IOS
        ? ios.shutdown(config)(device)
        : android.shutdown(config)(device);

Future<void> shutdownAll(c.Config config) =>
    Stream.fromFuture(flutter.running(config))
        .flatMap((i) => Stream.fromIterable(i))
        .asyncMap(shutdown(config))
        .last;

final cleanStatusBar = (c.Config config) => (Device device) =>
    device.platform == DevicePlatform.IOS
        ? ios.cleanStatusBar(config)(device)
        : android.cleanStatusBar(config)(device);

final cleanStatusBarFromEnv = (c.Config config) => c.currentDevice().fold(
      () => Future.value(),
      cleanStatusBar(config),
    );

final screenshot = (c.Config config) => (Device device) =>
    device.platform == DevicePlatform.IOS
        ? ios.screenshot(config)(device)
        : android.screenshot(config)(device);

final screenshotFromEnv = (c.Config config) => c.currentDevice().traverseFuture(
    (device) =>
        screenshot(config)(device).then((image) => tuple2(device, image)));

final writeScreenshot = (c.Config config) => ({
      required String iosPath,
      required String androidPath,
    }) =>
        (Device device) => (String name) =>
            screenshot(config)(device).then<void>((image) async {
              final file = [device.name, '$name.png'].join('_');
              final basePath =
                  device.platform == DevicePlatform.IOS ? iosPath : androidPath;
              final path = p.join(basePath, file);

              await Directory(basePath).create(recursive: true);
              await File(path).writeAsBytes(image);
            });

final writeScreenshotFromEnv = (c.Config config) => ({
      required String iosPath,
      required String androidPath,
    }) =>
        c.currentDevice().fold(
              () => (String name) => Future.value(),
              writeScreenshot(config)(
                androidPath: androidPath,
                iosPath: iosPath,
              ),
            );

final forEach = (c.Config config) => (List<String> nameOrIds) =>
    (Future<void> Function(Device) process) =>
        Stream.fromFuture(shutdownAll(config))
            .asyncMap((event) => list(config))
            .flatMap((i) => Stream.fromIterable(i))
            .where(
                (d) => nameOrIds.contains(d.id) || nameOrIds.contains(d.name))
            .asyncMap<void>((d) async {
          await boot(config)(d);
          final running = await flutter.waitUntilRunning(config)(d.platform);
          await process(running.copyWith(name: d.name));
          return shutdown(config)(running);
        }).last;
