import 'package:emulators/src/device.dart';
import 'package:emulators/src/device/utils.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:fpdt/reader_task_either.dart' as RTE;
import 'package:fpdt/state_reader_task_either.dart' as SRTE;
import 'package:fpdt/task_either.dart' as TE;

IList<DeviceState> _parseDevices(dynamic json) => O
    .some(json as Map<String, dynamic>)
    .extractMap('devices')
    .chain(O.map((devices) => devices.values
        .expand((runtime) => (runtime as List)
            .cast()
            .where((device) => device['isAvailable'])
            .map((device) => DeviceState(
                  id: device['udid'],
                  name: device['name'],
                  platform: DevicePlatform.ios,
                  emulator: true,
                  booted: device["state"] == "Booted",
                )))
        .toIList()))
    .p(O.getOrElse(() => IList()));

final list = RTE
    .ask<Toolchain, DeviceError>()
    .p(RTE.chainTryCatchK(
      (tc) => tc.simctl(['list', 'devices', '--json']).json(),
      (err, stackTrace) => DeviceError.toolchainFailure(
        op: 'list',
        command: 'simctl list devices',
        message: '$err',
      ),
    ))
    .p(RTE.map(_parseDevices))
    .p(RTE.flatMap(
      (devices) => (tc) => devices
          .map((d) => Device(state: d, toolchain: tc))
          .toIList()
          .p(TE.right),
    ));

final DeviceOp<void> boot = opAsk()
    .p(SRTE.flatMapR((_) => (s) => TE.tryCatchK(
          (tc) => tc.simctl(['boot', s.id]).string(),
          (err, stackTrace) => DeviceError.toolchainFailure(
            op: 'boot',
            command: 'simctl boot',
            message: '$err',
          ),
        )))
    .p(SRTE.chainModify((s) => s.copyWith(booted: true)));

final DeviceOp<void> shutdown = opAsk()
    .p(SRTE.flatMapR((_) => (s) => TE.tryCatchK(
          (tc) => tc.simctl(['shutdown', s.id]).string(),
          (err, stackTrace) => DeviceError.toolchainFailure(
            op: 'shutdown',
            command: 'simctl shutdown',
            message: '$err',
          ),
        )))
    .p(SRTE.delay(Duration(seconds: 3)))
    .p(SRTE.chainModify((s) => s.copyWith(booted: false)));

final screenshot = opAsk().p(SRTE.flatMapR((_) => (s) => TE.tryCatchK(
      (tc) => tc.simctl([
        'io',
        s.id,
        'screenshot',
        '-',
      ]).binary(),
      (err, stackTrace) => DeviceError.toolchainFailure(
        op: 'screenshot',
        command: 'simctl io screenshot',
        message: '$err',
      ),
    )));

final DeviceOp<void> cleanStatusBar = opAsk()
    .p(SRTE.flatMapR((_) => (s) => TE.tryCatchK(
          (tc) => tc.simctl([
            "status_bar",
            s.id,
            "override",
            "--time",
            "2021-06-30T12:00:00+00:00",
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
          ]).string(),
          (err, stackTrace) => DeviceError.toolchainFailure(
            op: 'cleanStatusBar',
            command: 'simctl status_bar',
            message: '$err',
          ),
        )))
    .p(SRTE.delay(const Duration(seconds: 2)));

final DeviceOp<void> maybeResolveName = SRTE.right(null);
