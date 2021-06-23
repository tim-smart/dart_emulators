import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:emulators/src/config.dart';
import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/utils/process.dart' as process;
import 'package:emulators/src/utils/strings.dart' as strings;
import 'package:rxdart/rxdart.dart' hide Kind;

final flutter = (Config config) => (
      List<String> args, {
      Map<String, String>? env,
    }) =>
        process.run(config.flutterPath, args, env: env);

Future<List<Device>> running(Config config) => flutter(config)(['devices'])
    .then((out) => strings.splitLines(out).fold<List<Device>>(
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
  final kind = _parseKind(parts[2]);

  return some(Device(
    id: id,
    name: name,
    platform: kind,
    booted: true,
  ));
}

DevicePlatform _parseKind(String input) {
  if (input.contains('ios')) {
    return DevicePlatform.IOS;
  } else if (input.contains('android')) {
    return DevicePlatform.ANDROID;
  }

  return DevicePlatform.WEB;
}

Future<Option<Device>> Function(DevicePlatform) firstOfKind(Config config) =>
    (kind) => running(config)
        .then((devices) => devices.firstWhereOrNull((d) => d.platform == kind))
        .then(optionOf);

Future<Device> Function(DevicePlatform) waitUntilRunning(Config config) => (
      DevicePlatform kind, {
      Duration timeout = const Duration(seconds: 60),
    }) =>
        Rx.merge([
          Stream.value(null),
          Stream.periodic(Duration(seconds: 1)),
        ])
            .asyncMap((_) => firstOfKind(config)(kind))
            .where((d) => d.isSome())
            .map((d) => d.toNullable()!)
            .first
            .timeout(timeout);

final drive = (Config config) =>
    (Device device, String target) => Process.start(config.flutterPath, [
          'drive',
          '-d',
          device.id,
          '--target=$target',
        ], environment: {
          'EMULATORS_DEVICE': json.encode(device.toJson()),
        });
