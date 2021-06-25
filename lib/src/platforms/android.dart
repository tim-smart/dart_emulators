import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:emulators/src/config.dart';
import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/utils/process.dart' as process;
import 'package:emulators/src/utils/strings.dart' as strings;
import 'package:rxdart/rxdart.dart';

final emulator = (Config config) =>
    (List<String> args) => process.run(config.emulatorPath, args);

final adb =
    (Config config) => (List<String> args) => process.run(config.adbPath, args);

final avdmanager = (Config config) =>
    (List<String> args) => process.run(config.avdmanagerPath, args);

final list =
    (Config config) => Stream.fromFuture(emulator(config)(["-list-avds"]))
        .flatMap((out) => Stream.fromIterable(strings.splitLines(out)))
        .map((name) => Device(
              id: name,
              name: name,
              platform: DevicePlatform.ANDROID,
              emulator: true,
            ))
        .handleError((_) => Stream.empty());

Future<Device> Function(Device) boot(Config config) =>
    (device) => Process.start(config.emulatorPath, ["-avd", device.id])
        .then((process) => device.copyWith(
              booted: true,
              process: some(process),
            ));

Future<Device> Function(Device) shutdown(Config config) => (device) {
      if (!device.booted) return Future.value(device);

      return device.process.fold(
        () => adb(config)(['-s', device.id, 'emu', 'kill'])
            .then((_) => Future.delayed(Duration(seconds: 3)))
            .then((_) => device.copyWith(booted: false)),
        (process) {
          process.kill(ProcessSignal.sigint);
          return process.stdout.forEach((_) {}).then((_) => device.copyWith(
                booted: false,
                process: none(),
              ));
        },
      );
    };

final cleanStatusBar = (Config config) => (Device device) =>
    Stream.fromIterable([
      // enable
      'shell settings put global sysui_demo_allowed 1',
      // display time 12:00
      'shell am broadcast -a com.android.systemui.demo -e command clock -e hhmm 1200',
      // Display full wifi
      'shell am broadcast -a com.android.systemui.demo -e command network -e wifi show -e level 4',
      // Display full mobile data without type
      'shell am broadcast -a com.android.systemui.demo -e command network -e mobile show -e level 4 -e datatype false',
      // Hide notifications
      'shell am broadcast -a com.android.systemui.demo -e command notifications -e visible false',
      // Show full battery but not in charging state
      'shell am broadcast -a com.android.systemui.demo -e command battery -e plugged false -e level 100'
    ])
        .map((args) => ['-s', device.id, ...args.split(' ')])
        .asyncMap(adb(config))
        .forEach((_) {})
        .then((_) => Future.delayed(Duration(seconds: 2)));

final screenshot =
    (Config config) => (Device device) => process.runBinary(config.adbPath, [
          '-s',
          device.id,
          'exec-out',
          'screencap',
          '-p',
        ]);

/**
 * Maps the device id back to the AVD name
 */
final updateDeviceName = (Config config) => (Device device) => adb(config)([
      "-s",
      device.id,
      "emu",
      "avd",
      "name",
    ]).then<Device>((out) {
      final parts = out.split("\n").map((s) => s.trim()).toList();
      if (parts.length != 2 && parts[1] != "OK") return device;
      return device.copyWith(name: parts.first);
    });
