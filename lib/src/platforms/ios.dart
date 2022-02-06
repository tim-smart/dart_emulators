import 'dart:io';

import 'package:emulators/src/platforms/emulation_layer.dart';
import 'package:emulators/src/utils/command.dart';
import 'package:fpdt/option.dart' as O;
import 'package:emulators/src/config.dart';
import 'package:emulators/src/models/device.dart';

class IOS extends EmulationLayer {
  IOS(this.config)
      : simctl = Command(
          path: config.xcrunPath,
          prefixArgs: ['simctl'],
        );

  final Config config;

  final Command simctl;

  @override
  Future<List<Device>> listDevices() async {
    final dynamic cmdOutput = await simctl.executeJson([
      'list',
      'devices',
      '--json',
    ]);
    return _parseDevices(cmdOutput);
  }

  @override
  Future<Device> boot(Device device) async {
    if (device.booted) return device;
    final Process process = await simctl.startProcess([
      'boot',
      device.id,
    ]);
    return device.copyWith(booted: true, process: O.some(process));
  }

  @override
  Future<Device> shutdown(Device device) async {
    // The device already isn't running.
    if (!device.booted) return device;

    await simctl.execute([
      'shutdown',
      device.id,
    ]);
    await Future.delayed(Duration(seconds: 3));
    return device;
  }

  @override
  Future<List<int>> screenshot(Device device) {
    return simctl.executeBinary([
      'io',
      device.id,
      'screenshot',
      '-',
    ]);
  }

  @override
  Future<void> cleanStatusBar(Device device) async {
    await simctl.execute([
      'status_bar',
      device.id,
      'override',
      '--time',
      '2021-06-30T12:00:00+00:00',
      '--dataNetwork',
      'wifi',
      '--wifiMode',
      'active',
      '--wifiBars',
      '3',
      '--cellularMode',
      'active',
      '--batteryState',
      'discharging',
      '--batteryLevel',
      '100',
    ]);
    // Wait for ui to update.
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Future<Device> updateDeviceName(Device device) async {
    // This does nothing on IOS as it's only required for android.
    return device;
  }
}

List<Device> _parseDevices(Map<String, dynamic> json) {
  return json['devices'].values.expand<Device>((devices) {
    return (devices as List<dynamic>)
        .where((device) => device['isAvailable'] as bool)
        .map<Device>(
          (device) => Device(
            id: device['udid'],
            name: device['name'],
            platform: DevicePlatform.IOS,
            emulator: true,
            booted: device['state'] == 'Booted',
          ),
        );
  }).toList();
}
