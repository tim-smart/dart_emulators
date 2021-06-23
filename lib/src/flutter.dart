import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:emulators/src/config.dart';
import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/utils/process.dart' as process;
import 'package:emulators/src/utils/strings.dart' as strings;
import 'package:rxdart/rxdart.dart' hide Kind;

Future<String> current() async => '';

Future<List<Device>> running(Config config) => process.run(config.flutterPath, [
      'devices',
    ]).then((out) => strings.splitLines(out).fold<List<Device>>(
          [],
          (devices, line) => _parseDevicesLine(line).fold(
            () => devices,
            (d) => [...devices, d],
          ),
        ));

Option<Device> _parseDevicesLine(String input) {
  final parts = input.split('•').map((s) => s.trim()).toList();
  if (parts.length != 4) return none();

  final name =
      parts[0].replaceAll(RegExp(r'\((web|mobile|desktop)\)'), '').trim();
  final id = parts[1];
  final kind = parts[2] == 'ios'
      ? DevicePlatform.IOS
      : (parts[2].contains('web')
          ? DevicePlatform.WEB
          : DevicePlatform.ANDROID);

  return some(Device(
    id: id,
    name: name,
    platform: kind,
    booted: true,
  ));
}

Future<Option<Device>> Function(DevicePlatform) firstOfKind(Config config) =>
    (kind) => running(config)
        .then((devices) => devices.firstWhereOrNull((d) => d.platform == kind))
        .then(optionOf);

Future<Device> Function(DevicePlatform) waitUntilRunning(Config config) => (
      DevicePlatform kind, {
      Duration timeout = const Duration(seconds: 30),
    }) =>
        Rx.merge([
          Stream.value(null),
          Stream.periodic(Duration(seconds: 1)),
        ])
            .asyncMap((_) => firstOfKind(config)(kind))
            .where((d) => d.isSome())
            .map((d) => d.toNullable()!)
            .last
            .timeout(timeout);
