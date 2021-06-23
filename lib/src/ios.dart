import 'package:dartz/dartz.dart';
import 'package:emulators/src/config.dart';
import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/utils/process.dart' as process;

Future<List<Device>> list(Config config) => process
    .runJson(config.xcrunPath, [
      "simctl",
      "list",
      "devices",
      "--json",
    ])
    .then((out) => _parseDevices(out).getOrElse(() => []))
    .catchError((_) => <Device>[]);

Option<List<Device>> _parseDevices(dynamic json) => optionOf(json['devices'])
    .map((json) => cast<Map<String, dynamic>>(json))
    .map((devices) => devices.entries
        .expand((runtime) => cast<List<dynamic>>(runtime.value)
            .where((device) => device['isAvailable'])
            .map((device) => Device(
                id: device['udid'],
                name: device['name'],
                platform: DevicePlatform.IOS,
                booted: device["state"] == "Booted")))
        .toList());

Future<void> Function(Device) boot(Config config) =>
    (device) => process.run(config.xcrunPath, [
          "simctl",
          "boot",
          device.id,
        ]);

Future<void> Function(Device) shutdown(Config config) =>
    (device) => process.run(config.xcrunPath, [
          "simctl",
          "shutdown",
          device.id,
        ]).then((_) => Future.delayed(Duration(seconds: 3)));

Future<List<int>> screenshot(Config config) =>
    process.runBinary(config.xcrunPath, [
      'simctl',
      'io',
      'booted',
      'screenshot',
      '-',
    ]);
