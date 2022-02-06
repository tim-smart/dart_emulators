import 'dart:io';

import 'package:emulators/src/platforms/emulation_layer.dart';
import 'package:emulators/src/utils/command.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:emulators/src/config.dart';
import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/utils/strings.dart' as strings;

class Android implements EmulationLayer {
  Android(this.config)
      : emulator = Command(path: config.emulatorPath, verbose: config.verbose),
        adb = Command(path: config.adbPath, verbose: config.verbose),
        avdManager =
            Command(path: config.avdmanagerPath, verbose: config.verbose);

  /// Emulators configuration that manages the various command paths.
  final Config config;

  /// Wrapper for the `emulator` CLI tools from the Android SDK
  final Command emulator;

  /// Wrapper for the `adb` CLI tool.
  final Command adb;

  /// Wrapper for the 'avdmanager' CLI tool from the Android SDK.
  final Command avdManager;

  /// Get a list of all the android devices.
  Future<List<Device>> listDevices() async {
    final String cmdOutput = await emulator.execute(["-list-avds"]);
    return cmdOutput
        .splitLines()
        .map((name) => Device(
              id: name,
              name: name,
              platform: DevicePlatform.ANDROID,
              emulator: true,
            ))
        .toList();
  }

  /// Clean the device's statusbar, ready for nice screenshots.
  Future<void> cleanStatusBar(Device device) async {
    for (final List<String> args in [
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
    ].map((args) => ['-s', device.id, ...args.split(' ')])) {
      await adb.execute(args);
    }
    // Wait 2 seconds to give the UI time to update.
    await Future.delayed(Duration(seconds: 2));
  }

  /// Boot an Android emulator.
  Future<Device> boot(Device device) async {
    if (device.booted) return device;
    final Process process = await emulator.startProcess(["-avd", device.id]);
    return device.copyWith(
      booted: true,
      process: O.some(process),
    );
  }

  /// Shutdown an Android emulator.
  Future<Device> shutdown(Device device) async {
    // The device already isn't running.
    if (!device.booted) return device;

    return device.process.chain(
      O.fold(
        () => adb
            .execute(['-s', device.id, 'emu', 'kill'])
            .then((_) => Future.delayed(Duration(seconds: 3)))
            .then((_) => device.copyWith(booted: false)),
        (process) {
          process.kill(ProcessSignal.sigint);
          return process.stdout.forEach((_) {}).then((_) => device.copyWith(
                booted: false,
                process: O.none(),
              ));
        },
      ),
    );
  }

  Future<List<int>> screenshot(Device device) {
    print('argablargblargblarg');
    return adb.executeBinary([
      '-s',
      device.id,
      'exec-out',
      'screencap',
      '-p',
    ]);
  }

  /// Maps the device id back to the AVD name.
  Future<Device> updateDeviceName(Device device) {
    return adb.execute([
      "-s",
      device.id,
      "emu",
      "avd",
      "name",
    ]).then<Device>(
      strings.stringOption
          .compose(O.map((s) => s.splitLines().toList()))
          .compose(O.filter((parts) => parts.length == 2))
          .compose(O.filter((parts) => parts.last == "OK"))
          .compose(O.map((parts) => parts.first))
          .compose(O.fold(
            () => device,
            (name) => device.copyWith(name: name),
          )),
    );
  }
}
