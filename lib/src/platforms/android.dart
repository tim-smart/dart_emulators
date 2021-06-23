import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:emulators/src/config.dart';
import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/utils/process.dart' as process;
import 'package:emulators/src/utils/strings.dart' as strings;

Future<List<Device>> list(Config config) => process
    .run(config.emulatorPath, ["-list-avds"])
    .then((out) => strings
        .splitLines(out)
        .map((name) => Device(
              id: name,
              name: name,
              platform: DevicePlatform.ANDROID,
            ))
        .toList())
    .catchError((_) => <Device>[]);

Future<Device> Function(Device) boot(Config config) =>
    (device) => Process.start(config.emulatorPath, ["-avd", device.id])
        .then((process) => device.copyWith(
              booted: true,
              process: some(process),
            ));

Future<Device> Function(Device) shutdown(Config config) => (device) {
      if (!device.booted) return Future.value(device);

      return device.process.fold(
        () => process
            .run(config.adbPath, ["-s", device.id, "emu", "kill"]).then(
                (_) => device.copyWith(booted: false)),
        (process) {
          process.kill(ProcessSignal.sigint);
          return process.stdout.last.then((_) => device.copyWith(
                booted: false,
                process: none(),
              ));
        },
      );
    };

Future<void> Function(String) adb(Config config) =>
    (command) => process.run(config.adbPath, command.split(' '));

Future<void> demoMode(Config config) => Stream.fromIterable([
      // display time 12:00
      'shell am broadcast -a com.android.systemui.demo -e command clock -e hhmm 1200',
      // Display full mobile data without type
      'shell am broadcast -a com.android.systemui.demo -e command network -e mobile show -e level 4 -e datatype false',
      // Hide notifications
      'shell am broadcast -a com.android.systemui.demo -e command notifications -e visible false',
      // Show full battery but not in charging state
      'shell am broadcast -a com.android.systemui.demo -e command battery -e plugged false -e level 100'
    ]).asyncMap(adb(config)).last;

Future<void> exitDemoMode(Config config) => adb(config)(
    'shell am broadcast -a com.android.systemui.demo -e command exit');

Future<List<int>> Function(Device) screenshot(Config config) => (device) async {
      await demoMode(config);
      await Future.delayed(Duration(seconds: 2));
      final image = await process.runBinary(config.adbPath, [
        '-s',
        device.id,
        'exec-out',
        'screencap',
        '-p',
      ]);
      await exitDemoMode(config);

      return image;
    };
