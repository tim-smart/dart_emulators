import 'package:dartz/dartz.dart';
import 'package:emulators/src/config.dart';
import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/utils/process.dart' as process;
import 'package:rxdart/rxdart.dart';

final simctl =
    (Config config) => (List<String> args) => process.run(config.xcrunPath, [
          "simctl",
          ...args,
        ]);

final list =
    (Config config) => Stream.fromFuture(process.runJson(config.xcrunPath, [
          "simctl",
          "list",
          "devices",
          "--json",
        ])).flatMap<Device>((out) => _parseDevices(out).fold(
              () => Stream.empty(),
              (devices) => Stream.fromIterable(devices),
            ));

Option<List<Device>> _parseDevices(dynamic json) => optionOf(json['devices'])
    .map((json) => cast<Map<String, dynamic>>(json))
    .map((devices) => devices.entries
        .expand((runtime) => cast<List<dynamic>>(runtime.value)
            .where((device) => device['isAvailable'])
            .map((device) => Device(
                  id: device['udid'],
                  name: device['name'],
                  platform: DevicePlatform.IOS,
                  emulator: true,
                  booted: device["state"] == "Booted",
                )))
        .toList());

final boot = (Config config) => (Device device) => simctl(config)([
      "boot",
      device.id,
    ]).then((_) => device.copyWith(booted: true));

final shutdown = (Config config) => (Device device) => simctl(config)([
      "shutdown",
      device.id,
    ]).then((_) => Future.delayed(Duration(seconds: 3)));

final screenshot =
    (Config config) => (Device device) => process.runBinary(config.xcrunPath, [
          'simctl',
          'io',
          device.id,
          'screenshot',
          '-',
        ]);

final cleanStatusBar = (Config config) => (Device device) => simctl(config)([
      "status_bar",
      device.id,
      "override",
      "--time",
      "12:00",
      "--dataNetwork",
      "wifi",
      "--wifiMode",
      "active",
      "--wifiBars",
      "3",
      "--cellularMode",
      "active",
      "--batteryState",
      "discharging",
      "--batteryLevel",
      "100",
    ]).then((_) => Future.delayed(Duration(seconds: 2)));
