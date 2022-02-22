import 'dart:io';

import 'package:emulators/src/device.dart';
import 'package:emulators/src/device/utils.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:emulators/src/utils/strings.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:fpdt/reader_task_either.dart' as RTE;
import 'package:fpdt/state_reader_task_either.dart' as SRTE;
import 'package:fpdt/task_either.dart' as TE;

final list = RTE
    .ask<Toolchain, DeviceError>()
    .p(RTE.chainTryCatchK(
      (tc) => tc.emulator(["-list-avds"]).string(),
      (err, stackTrace) => DeviceError.toolchainFailure(
        op: 'list',
        command: 'emulator -list-avds',
        message: '$err',
      ),
    ))
    .p(RTE.map((out) => splitLines(out).map((name) => DeviceState(
          id: name,
          name: name,
          platform: DevicePlatform.android,
          emulator: true,
        ))))
    .p(RTE.flatMap(
      (a) => (tc) =>
          a.map((s) => Device(state: s, toolchain: tc)).toIList().p(TE.right),
    ));

final boot = opAsk()
    .p(SRTE.flatMapR((a) => (s) => TE.tryCatchK(
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

final DeviceOp<void> shutdown = opAsk().p(SRTE.flatMapS((_) => (s) => (tc) {
      if (s.booted == false) {
        return TE.right(s);
      }

      return s.process.p(O.fold(
        () => TE
            .tryCatch(
              () => tc.adb(['-s', s.id, 'emu', 'kill']).string(),
              (err, stackTrace) => DeviceError.toolchainFailure(
                op: 'shutdown',
                command: 'adb emu kill',
                message: '$err',
              ),
            )
            .p(TE.delay(Duration(seconds: 3)))
            .p(TE.map((_) => s.copyWith(booted: false))),
        (process) => TE.tryCatch(
          () async {
            process.kill(ProcessSignal.sigint);
            await process.stdout.forEach((_) {});
            return s.copyWith(booted: false, process: kNone);
          },
          (err, stackTrace) => DeviceError.processKillFailure(
            op: 'shutdown',
            message: '$err',
          ),
        ),
      ));
    }));

final DeviceOp<void> cleanStatusBar = opAsk().p(SRTE.flatMapR(
  (_) => (s) => (tc) => [
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
          .p(TE.sequenceSeq),
));

final screenshot = opAsk().p(SRTE.flatMapR((_) => (s) => TE.tryCatchK(
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

final DeviceOp<void> maybeResolveName = opAsk()
    .p(SRTE.flatMapR((_) => (s) => TE.tryCatchK(
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
    .p(SRTE.flatMapS(
      (out) => (s) => _maybeParseName(out).p(O.fold(
            () => RTE.right(s),
            (name) => RTE.right(s.copyWith(name: name)),
          )),
    ));
