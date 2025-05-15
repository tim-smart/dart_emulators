part of '../platform_device.dart';

class AndroidDevice implements PlatformDevice {
  AndroidDevice({
    required this.toolchain,
    required DeviceState state,
  }) : ref = Ref.unsafeMake(state);

  final Toolchain toolchain;
  final Ref<DeviceState> ref;

  @override
  DeviceState get state => ref.unsafeGet();

  @override
  DeviceIO<Unit> setState(DeviceState state) => ref.set(state);

  static final list = ToolchainIO.envWithZIO(
    (env) => EIO
        .tryCatch(
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

  @override
  DeviceIO<Unit> get boot => DeviceIO.tryCatchEnv(
        (env) => toolchain.emulator(["-avd", state.id]).process(),
        (error, stackTrace) => DeviceError.toolchainFailure(
          op: 'boot',
          command: 'emulator -avd',
          message: '$error',
        ),
      ) //
          .flatMap((process) => ref.update((s) => s.copyWith(
                booted: true,
                process: Option.of(process),
              )));

  @override
  DeviceIO<Unit> get shutdown => state.booted ? _shutdown : ZIO.unit();

  DeviceIO<Unit> get _adbKill => DeviceIO.tryCatchEnv(
        (env) => toolchain.adb([
          "-s",
          state.id,
          "emu",
          "kill",
        ]).string(),
        (error, stackTrace) => DeviceError.toolchainFailure(
          op: 'shutdown',
          command: 'adb emu kill',
          message: '$error',
        ),
      ).zipRight(ZIO.sleep(const Duration(seconds: 3)));

  DeviceIO<Unit> _processKill(Process process) => EIO.tryCatch(
        () {
          process.kill(ProcessSignal.sigint);
          return process.stdout.forEach((_) {});
        },
        (error, stackTrace) => DeviceError.processKillFailure(
          op: 'shutdown',
          message: '$error',
        ),
      ).asUnit;

  DeviceIO<Unit> get _shutdown => state.process
      .match(
        () => _adbKill,
        (process) => _processKill(process),
      )
      .zipRight(
        ref.update((s) => s.copyWith(booted: false, process: const None())),
      );

  @override
  DeviceIO<Unit> get cleanStatusBar => [
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
            (args) => DeviceIO.tryCatch(
              () => toolchain.adb([
                "-s",
                state.id,
                ...args.split(' '),
              ]).string(),
              (error, stackTrace) => DeviceError.toolchainFailure(
                op: 'cleanStatusBar',
                command: 'adb $args',
                message: '$error',
              ),
            ),
          )
          .collect
          .asUnit;

  @override
  DeviceIO<List<int>> get screenshot => DeviceIO.tryCatch(
        () => toolchain.adb([
          '-s',
          state.id,
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

  @override
  DeviceIO<Unit> get maybeResolveName => DeviceIO.tryCatch(
        () => toolchain.adb([
          "-s",
          state.id,
          "emu",
          "avd",
          "name",
        ]).string(),
        (err, stackTrace) => DeviceError.toolchainFailure(
          op: 'maybeResolveName',
          command: 'adb emu avd name',
          message: '$err',
        ),
      ) //
          .map(maybeParseName)
          .flatMap(
            (a) => a.match(
              () => ZIO.unitIO,
              (name) => ref.updateIO((s) => s.copyWith(name: name)),
            ),
          );

  @override
  DeviceIO<Unit> setAppearance(Appearance appearance) {
    final yesOrNo = switch (appearance) {
      Appearance.dark => "yes",
      Appearance.light => "no",
    };
    return DeviceIO.tryCatch(
      () => toolchain.adb(["shell", "cmd uimode night $yesOrNo"]).string(),
      (err, stackTrace) => DeviceError.toolchainFailure(
        op: 'screenshot',
        command: 'adb cmd uimode night $yesOrNo',
        message: '$err',
      ),
    ).asUnit;
  }
}

final maybeParseName = stringOption.c((_) => _
    .map(splitLines)
    .filter((parts) => parts.length == 2)
    .filter((parts) => parts.last == "OK")
    .map((parts) => parts.first));
