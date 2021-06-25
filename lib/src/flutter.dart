import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:emulators/src/config.dart';
import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/platforms/android.dart' as android;
import 'package:emulators/src/utils/process.dart' as process;
import 'package:emulators/src/utils/strings.dart' as strings;
import 'package:rxdart/rxdart.dart' hide Kind;

final flutter = (Config config) => (
      List<String> args, {
      Map<String, String>? env,
    }) =>
        process.run(config.flutterPath, args, env: env);

final running = (
  Config config, {
  bool onlyEmulators = true,
}) =>
    Stream.fromFuture(flutter(config)(['devices']))
        .flatMap((out) => Stream.fromIterable(strings.splitLines(out)))
        .flatMap<Device>((line) => _parseDevicesLine(line).fold(
              () => Stream.empty(),
              (d) => Stream.value(d),
            ))
        .where((d) => onlyEmulators ? d.emulator : true)
        .asyncMap<Device>((d) =>
            d.emulator && d.platform == DevicePlatform.ANDROID
                ? android.updateDeviceName(config)(d)
                : Future.value(d))
        .handleError((_) => Stream.empty());

Option<Device> _parseDevicesLine(String input) {
  final parts = input.split('•').map((s) => s.trim()).toList();
  if (parts.length != 4) return none();

  final name =
      parts[0].replaceAll(RegExp(r'\((web|mobile|desktop)\)'), '').trim();
  final id = parts[1];
  final kind = _parseKind(parts[2]);
  final emulator = RegExp(r'(emulator|simulator)').hasMatch(parts[3]);

  return some(Device(
    id: id,
    name: name,
    platform: kind,
    emulator: emulator,
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

final waitUntilRunning = (Config config) => (
      Device device, {
      Duration timeout = const Duration(seconds: 60),
    }) =>
        Rx.merge([
          Stream.value(null),
          Stream.periodic(Duration(seconds: 1)),
        ])
            .flatMap((_) => running(config))
            .where((d) => d.similar(device))
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
