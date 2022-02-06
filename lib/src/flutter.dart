import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:emulators/src/config.dart';
import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/platforms/android.dart';
import 'package:emulators/src/utils/command.dart';
import 'package:emulators/src/utils/strings.dart' as strings;

class Flutter extends Command {
  Flutter(this.config) : super(path: config.flutterPath);

  final Config config;

  Future<List<Device>> listRunningDevices({onlyEmulators = true}) async {
    final String devicesString = await execute(['devices']);
    Iterable<Device> devices = devicesString
        .splitLines()
        .map((line) => _parseDevicesLine(line))
        .where((d) => d != null)
        // We need to cast it back to non-null.
        .map((d) => d!)
        .where((d) => !onlyEmulators || d.emulator);
    return Future.wait(devices.map(
      (device) {
        if (device.platform == DevicePlatform.ANDROID) {
          return Android(config).updateDeviceName(device);
        }
        return Future.value(device);
      },
    ));
  }

  Device? _parseDevicesLine(String line) {
    final List<String> parts = line.split('•').map((s) => s.trim()).toList();
    if (parts.length != 4) {
      return null;
    }
    final name =
        parts[0].replaceAll(RegExp(r'\((web|mobile|desktop)\)'), '').trim();
    final id = parts[1];
    final kind = _parseKind(parts[2]);
    final emulator = RegExp(r'(emulator|simulator)').hasMatch(parts[3]);
    return Device(
      id: id,
      name: name,
      platform: kind,
      emulator: emulator,
      booted: true,
    );
  }

  /// Waits until the given [Device] is running, or errors with a timeout.
  ///
  /// Returns the (possibly updated) device now that it is running.
  Future<Device> waitUntilRunning(
    Device device, {
    Duration timeout = const Duration(seconds: 100),
  }) async {
    Future<Device> _checkEverySecond() async {
      while (true) {
        for (final Device runningDevice in await listRunningDevices()) {
          if (runningDevice.similar(device)) {
            return runningDevice;
          }
        }
      }
    }

    return _checkEverySecond().timeout(timeout);
  }

  Future<Process> drive(
    Device device,
    String target, {
    List<String> args = const [],
    Map<String, dynamic> commandConfig = const {},
  }) {
    return _runWithDevice(
      device,
      'drive',
      args: [
        '--target=$target',
        ...args,
      ],
      commandConfig: commandConfig,
    );
  }

  Future<Process> test(
  Device device,
      String target, {
  List<String> args = const [],
  Map<String, dynamic> commandConfig = const {},
  }) {
    return _runWithDevice(
      device,
      'test',
      args: [target, ...args],
      commandConfig: commandConfig,
    );
  }

  Future<Process> _runWithDevice(
    Device device,
    String flutterCommand, {
    required List<String> args,
    Map<String, dynamic>? commandConfig,
  }) {
    final configJson = json.encode(commandConfig);
    final deviceJson = json.encode(device.toJson());

    return startProcess([
      flutterCommand,
      '-d',
      device.id,
      '--dart-define',
      'EMULATORS_CONFIG=$configJson',
      '--dart-define',
      'EMULATORS_DEVICE=$deviceJson',
      ...args,
    ], env: {
      'EMULATORS_CONFIG': configJson,
      'EMULATORS_DEVICE': deviceJson,
    });
  }
}

DevicePlatform _parseKind(String input) {
  if (input.contains('ios')) {
    return DevicePlatform.IOS;
  } else if (input.contains('android')) {
    return DevicePlatform.ANDROID;
  }

  return DevicePlatform.WEB;
}
