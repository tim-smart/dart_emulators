import 'package:rxdart/rxdart.dart' hide Kind;
import 'package:emulators/src/config.dart' as c;
import 'package:emulators/src/android.dart' as android;
import 'package:emulators/src/ios.dart' as ios;
import 'package:emulators/src/flutter.dart' as flutter;
import 'package:emulators/src/models/device.dart';

Future<List<Device>> list(c.Config config) => Future.wait([
      android.list(config),
      ios.list(config),
    ]).then((results) => results.expand((i) => i).toList());

Future<void> Function(
  String id,
  bool Function(Device) pred, {
  Duration timeout,
}) waitUntil(Future<List<Device>> Function() list) => (
      id,
      pred, {
      timeout = const Duration(seconds: 30),
    }) =>
        Rx.merge([
          Stream.value(null),
          Stream.periodic(Duration(seconds: 2)),
        ])
            .asyncMap((_) => list())
            .map((list) => list.firstWhere((d) => d.id == id))
            .where(pred)
            .first
            .timeout(timeout);

Future<void> Function(Device) boot(c.Config config) =>
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

Future<List<int>> Function(DevicePlatform) screenshot(c.Config config) =>
    (platform) => platform == DevicePlatform.IOS
        ? ios.screenshot(config)
        : android.screenshot(config);
