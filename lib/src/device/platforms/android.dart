import 'dart:io';

import 'package:emulators/src/device.dart';
import 'package:emulators/src/device/utils.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:emulators/src/utils/strings.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:fpdt/state_reader_task_either.dart' as SRTE;
import 'package:fpdt/task_either.dart' as TE;

final list = (Toolchain tc) => TE
    .tryCatch(
      () => tc.emulator(["-list-avds"]).string(),
      (err, stackTrace) => DeviceError.toolchainFailure(
        op: 'list',
        command: 'emulator -list-avds',
        message: '$err',
      ),
    )
    .p(TE.map((out) => splitLines(out).map((name) => DeviceState(
          id: name,
          name: name,
          platform: DevicePlatform.android,
          emulator: true,
        ))))
    .p(TE.map((a) => a.map((s) => Device(state: s, toolchain: tc)).toIList()));

final boot = opGet()
    .p(SRTE.flatMapReaderTaskEither((s) => TE.tryCatchK(
          (tc) => tc.emulator(["-avd", s.id]).process(),
          (err, stackTrace) => DeviceError.toolchainFailure(
            op: 'boot',
            command: 'emulator -avd',
            message: '$err',
          ),
        )))
    .p(SRTE.flatMap((process) => SRTE.modify((s) => s.copyWith(
          booted: true,
          process: O.some(process),
        ))));

// == shutdown
final _adbKill = opGet()
    .p(SRTE.flatMapReaderTaskEither((s) => TE.tryCatchK(
          (tc) => tc.adb(['-s', s.id, 'emu', 'kill']).string(),
          (err, stackTrace) => DeviceError.toolchainFailure(
            op: 'shutdown',
            command: 'adb emu kill',
            message: '$err',
          ),
        )))
    .p(SRTE.delay(const Duration(seconds: 3)));

final _processKill = (Process process) => TE.tryCatch(
      () async {
        process.kill(ProcessSignal.sigint);
        await process.stdout.forEach((_) {});
      },
      (err, stackTrace) => DeviceError.processKillFailure(
        op: 'shutdown',
        message: '$err',
      ),
    );

final _shutdown = opGet()
    .p(SRTE.map((s) => s.process))
    .p(SRTE.flatMap(O.fold(
      () => _adbKill,
      _processKill.c(SRTE.fromTaskEither),
    )))
    .p(SRTE.chainModify((s) => s.copyWith(booted: false, process: kNone)));

final shutdown =
    opGet().p(SRTE.flatMap((s) => s.booted ? _shutdown : SRTE.right(unit)));

// == clean status bar
final cleanStatusBar = opGet()
    .p(SRTE.flatMapReaderTaskEither((s) => (tc) => [
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
            .map((args) => TE.tryCatch(
                  () => tc.adb(['-s', s.id, ...args.split(' ')]).string(),
                  (err, stackTrace) => DeviceError.toolchainFailure(
                    op: 'cleanStatusBar',
                    command: 'adb $args',
                    message: '$err',
                  ),
                ))
            .p(TE.sequenceSeq)))
    .p(SRTE.call(SRTE.right(unit)));

final screenshot = opGet().p(SRTE.flatMapReaderTaskEither((s) => TE.tryCatchK(
      (tc) => tc.adb([
        '-s',
        s.id,
        'exec-out',
        'screencap',
        '-p',
      ]).binary(),
      (err, stackTrace) => DeviceError.toolchainFailure(
        op: 'screenshot',
        command: 'adb exec-out screencap',
        message: '$err',
      ),
    )));

final _maybeParseName = stringOption
    .c(O.map(splitLines))
    .c(O.filter((parts) => parts.length == 2))
    .c(O.filter((parts) => parts.last == "OK"))
    .c(O.map((parts) => parts.first));

final maybeResolveName = opGet()
    .p(SRTE.flatMapReaderTaskEither((s) => TE.tryCatchK(
          (tc) => tc.adb([
            "-s",
            s.id,
            "emu",
            "avd",
            "name",
          ]).string(),
          (err, stackTrace) => DeviceError.toolchainFailure(
            op: 'maybeResolveName',
            command: 'adb emu avd name',
            message: '$err',
          ),
        )))
    .p(SRTE.map(_maybeParseName))
    .p(SRTE.flatMap(O.fold(
      () => SRTE.right(unit),
      (name) => SRTE.modify((s) => s.copyWith(name: name)),
    )));
