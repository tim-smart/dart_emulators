import 'package:elemental/elemental.dart';
import 'package:emulators/emulators.dart';
import 'package:emulators/src/device.dart';

IList<DeviceState> _parseDevices(dynamic json) => (json as Map<String, dynamic>)
    .extractMap('devices')
    .map((devices) => devices.values
        .expand((runtime) => (runtime as List)
            .cast()
            .where((device) => device['isAvailable'])
            .map((device) => DeviceState(
                id: device['udid'],
                name: device['name'],
                platform: DevicePlatform.ios,
                emulator: true,
                booted: device["state"] == "Booted")))
        .toIList())
    .getOrElse(() => IList());

final list = ZIO
    .tryCatchEnv(
      (Toolchain env) => env.simctl(['list', 'devices', '--json']).json(),
      (error, stackTrace) => DeviceError.toolchainFailure(
        op: 'list',
        command: 'simctl list devices',
        message: '$error',
      ),
    )
    .map(_parseDevices)
    .flatMapEnv(
      (devices, env) => ZIO.succeedLift(
        devices.map((d) => Device(state: d, toolchain: env)).toIList(),
      ),
    );

final boot = DeviceIO.tryCatchEnv(
  (env) => env.toolchain.simctl(['boot', env.id]).string(),
  (error, stackTrace) => DeviceError.toolchainFailure(
    op: 'boot',
    command: 'simctl boot',
    message: '$error',
  ),
) //
    .zipLeft(ZIO.sleepLift(const Duration(seconds: 3)))
    .flatMapEnv(
      (a, env) => env.ref.update((s) => s.copyWith(booted: true)).lift(),
    );

final shutdown = DeviceIO.tryCatchEnv(
  (env) => env.toolchain.simctl(['shutdown', env.id]).string(),
  (error, stackTrace) => DeviceError.toolchainFailure(
    op: 'shutdown',
    command: 'simctl shutdown',
    message: '$error',
  ),
) //
    .zipLeft(ZIO.sleepLift(const Duration(seconds: 3)))
    .flatMapEnv(
      (a, env) => env.ref.update((s) => s.copyWith(booted: false)).lift(),
    );

final screenshot = DeviceIO.tryCatchEnv(
  (env) => env.toolchain.simctl(['io', env.id, 'screenshot', '-']).binary(),
  (err, stackTrace) => DeviceError.toolchainFailure(
    op: 'screenshot',
    command: 'simctl io screenshot',
    message: '$err',
  ),
);

final cleanStatusBar = DeviceIO.tryCatchEnv(
  (env) => env.toolchain.simctl([
    "status_bar",
    env.id,
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
  (error, stackTrace) => DeviceError.toolchainFailure(
    op: 'cleanStatusBar',
    command: 'simctl status_bar',
    message: '$error',
  ),
).zipRight(ZIO.sleepLift(const Duration(seconds: 2)));

final DeviceIO<Unit> maybeResolveName = ZIO.unitLift();
