import 'dart:io';

import 'package:elemental/elemental.dart';
import 'package:emulators/src/device.dart';
import 'package:emulators/src/device/ops.dart';
import 'package:emulators/src/utils/strings.dart';

final list = ToolchainIO.envWithZIO(
  (env) => ToolchainIO.tryCatch(
    () => env.emulator(["-list-avds"]).string(),
    (err, stackTrace) => DeviceError.toolchainFailure(
      op: 'list',
      command: 'emulator -list-avds',
      message: '$err',
    ),
  ) //
      .map((out) => splitLines(out)
          .map((name) => DeviceState(
                id: name,
                name: name,
                platform: DevicePlatform.android,
                emulator: true,
              ))
          .map((s) => Device(state: s, toolchain: env))
          .toIList()),
);

final boot = DeviceIO.tryCatchEnv(
  (env) => env.toolchain.emulator(["-avd", env.id]).process(),
  (error, stackTrace) => DeviceError.toolchainFailure(
    op: 'boot',
    command: 'emulator -avd',
    message: '$error',
  ),
) //
    .flatMapEnv((process, env) => env.ref
        .update((s) => s.copyWith(
              booted: true,
              process: Option.of(process),
            ))
        .lift());

final _adbKill = DeviceIO.tryCatchEnv(
  (env) => env.toolchain.adb([
    "-s",
    env.id,
    "emu",
    "kill",
  ]).string(),
  (error, stackTrace) => DeviceError.toolchainFailure(
    op: 'shutdown',
    command: 'adb emu kill',
    message: '$error',
  ),
).zipRight(ZIO.sleep(const Duration(seconds: 3)));

final _processKill = (Process process) => EIO.tryCatch(
      () {
        process.kill(ProcessSignal.sigint);
        return process.stdout.forEach((_) {});
      },
      (error, stackTrace) => DeviceError.processKillFailure(
        op: 'shutdown',
        message: '$error',
      ),
    ).asUnit;

final _shutdown = DeviceIO.envWithZIO(
  (env) => env.state.process
      .match(
        () => _adbKill,
        (process) => _processKill(process).lift<DeviceEnv>(),
      )
      .zipRight(
        env.ref
            .update((s) => s.copyWith(booted: false, process: const None()))
            .lift(),
      ),
);

final shutdown = DeviceIO.envWithZIO(
  (env) => env.state.booted ? _shutdown : ZIO.unit(),
);

final cleanStatusBar = [
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
]
    .map(
      (args) => DeviceIO.tryCatchEnv(
        (env) => env.toolchain.adb([
          "-s",
          env.id,
          ...args.split(' '),
        ]).string(),
        (error, stackTrace) => DeviceError.toolchainFailure(
          op: 'cleanStatusBar',
          command: 'adb $args',
          message: '$error',
        ),
      ),
    )
    .collect()
    .asUnit;

final screenshot = DeviceIO.tryCatchEnv(
  (env) => env.toolchain.adb([
    '-s',
    env.id,
    'exec-out',
    'screencap',
    '-p',
  ]).binary(),
  (err, stackTrace) => DeviceError.toolchainFailure(
    op: 'screenshot',
    command: 'adb exec-out screencap',
    message: '$err',
  ),
);

final maybeParseName = stringOption.c((_) => _
    .map(splitLines)
    .filter((parts) => parts.length == 2)
    .filter((parts) => parts.last == "OK")
    .map((parts) => parts.first));

final maybeResolveName = DeviceIO.tryCatchEnv(
  (env) => env.toolchain.adb([
    "-s",
    env.id,
    "emu",
    "avd",
    "name",
  ]).string(),
  (err, stackTrace) => DeviceError.toolchainFailure(
    op: 'maybeResolveName',
    command: 'adb emu avd name',
    message: '$err',
  ),
).map(maybeParseName).flatMapEnv((a, env) => a.match(
      () => ZIO.unit(),
      (name) => env.ref.update((s) => s.copyWith(name: name)).lift(),
    ));
