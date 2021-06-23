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

final screenshot = (c.Config config) => (Device device) =>
    device.platform == DevicePlatform.IOS
        ? ios.screenshot(config)(device)
        : android.screenshot(config)(device);

final screenshotFromEnv =
    (c.Config config) => c.currentDevice().traverseFuture(screenshot(config));

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
          await process(running);
          return shutdown(config)(running);
        }).last;
