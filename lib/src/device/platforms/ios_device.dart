part of '../platform_device.dart';

class IosDevice implements PlatformDevice {
  IosDevice({
    required this.toolchain,
    required DeviceState state,
  }) : ref = Ref.unsafeMake(state);

  final Toolchain toolchain;
  final Ref<DeviceState> ref;

  @override
  DeviceState get state => ref.unsafeGet();

  @override
  DeviceIO<Unit> setState(DeviceState state) => ref.set(state);

  static final list = ToolchainIO.tryCatchEnv(
    (env) => env.simctl(['list', 'devices', '--json']).json(),
    (error, stackTrace) => DeviceError.toolchainFailure(
      op: 'list',
      command: 'simctl list devices',
      message: '$error',
    ),
  ) //
      .map(_parseDevices)
      .flatMapEnv(
        (devices, env) => ZIO.succeed(
          devices.map((d) => Device(state: d, toolchain: env)).toIList(),
        ),
      );

  @override
  DeviceIO<Unit> get boot => DeviceIO.tryCatch(
        () => toolchain.simctl(['boot', state.id]).string(),
        (error, stackTrace) => DeviceError.toolchainFailure(
          op: 'boot',
          command: 'simctl boot',
          message: '$error',
        ),
      ) //
          .zipLeft(ZIO.sleep(const Duration(seconds: 3)))
          .flatMap(
            (a) => ref.update((s) => s.copyWith(booted: true)),
          );

  @override
  DeviceIO<Unit> get shutdown => DeviceIO.tryCatch(
        () => toolchain.simctl(['shutdown', state.id]).string(),
        (error, stackTrace) => DeviceError.toolchainFailure(
          op: 'shutdown',
          command: 'simctl shutdown',
          message: '$error',
        ),
      ) //
          .zipLeft(ZIO.sleep(const Duration(seconds: 3)))
          .flatMap(
            (a) => ref.update((s) => s.copyWith(booted: false)),
          );

  @override
  DeviceIO<List<int>> get screenshot => DeviceIO.tryCatch(
        () => toolchain.simctl(['io', state.id, 'screenshot', '-']).binary(),
        (error, stackTrace) => DeviceError.toolchainFailure(
          op: 'screenshot',
          command: 'simctl io screenshot',
          message: '$error',
        ),
      );

  @override
  DeviceIO<Unit> get cleanStatusBar => DeviceIO.tryCatch(
        () => toolchain.simctl([
          "status_bar",
          state.id,
          "override",
          "--time",
          "2021-06-30T12:00:00.000+00:00",
          "--dataNetwork",
          "wifi",
          "--wifiMode",
          "active",
          "--wifiBars",
          "3",
          "--cellularMode",
          "active",
          "--cellularBars",
          "4",
          "--operatorName",
          "",
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
      ).zipRight(ZIO.sleep(const Duration(seconds: 2)));

  @override
  DeviceIO<Unit> get maybeResolveName => ZIO.unitIO;

  @override
  DeviceIO<Unit> setAppearance(Appearance appearance) {
    final darkOrLight = switch (appearance) {
      Appearance.dark => "dark",
      Appearance.light => "light",
    };
    return DeviceIO.tryCatch(
          () => toolchain.simctl(['ui', state.id, 'appearance', darkOrLight]).string(),
          (err, stackTrace) => DeviceError.toolchainFailure(
        op: 'setAppearance',
        command: 'xrun simctl cmd uimode night $darkOrLight',
        message: '$err',
      ),
    ).asUnit;
  }
}

// ==== helpers ====

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
