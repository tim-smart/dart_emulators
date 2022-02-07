part of "../device.dart";

class AndroidDeviceManager implements DeviceManager {
  const AndroidDeviceManager(this.toolchain);

  final Toolchain toolchain;

  @override
  Stream<Device> list() =>
      Stream.fromFuture(toolchain.emulator(["-list-avds"]).string())
          .flatMap((out) => Stream.fromIterable(splitLines(out)))
          .map((name) => DeviceState(
                id: name,
                name: name,
                platform: DevicePlatform.android,
                emulator: true,
              ))
          .map((state) => Device.fromState(state, toolchain: toolchain))
          .handleError((_) => Stream.empty());
}

class AndroidDevice extends Device {
  AndroidDevice({
    required DeviceState state,
    required Toolchain toolchain,
  })  : assert(state.platform == DevicePlatform.android),
        super(state: state, toolchain: toolchain);

  @override
  Future<void> boot() =>
      _toolchain.emulator(["-avd", _state.id]).process().then((process) {
            _state = _state.copyWith(
              booted: true,
              process: O.some(process),
            );
          });

  @override
  Future<void> shutdown() async {
    if (!_state.booted) return;

    return _state.process.chain(O.fold(
      () async {
        await _toolchain.adb(['-s', _state.id, 'emu', 'kill']).string();
        await Future.delayed(Duration(seconds: 3));
        _state = _state.copyWith(booted: false);
      },
      (process) async {
        process.kill(ProcessSignal.sigint);
        await process.stdout.forEach((_) {});
        _state = _state.copyWith(
          booted: false,
          process: O.none(),
        );
      },
    ));
  }

  @override
  Future<void> cleanStatusBar() => Stream.fromIterable([
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
          .map((args) => ['-s', _state.id, ...args.split(' ')])
          .asyncMap(_toolchain.adb)
          .forEach((_) {})
          .then((_) => Future.delayed(Duration(seconds: 2)));

  @override
  Future<List<int>> screenshot() => _toolchain.adb([
        '-s',
        _state.id,
        'exec-out',
        'screencap',
        '-p',
      ]).binary();

  @override
  Future<void> maybeResolveName() async {
    final output = await _toolchain.adb([
      "-s",
      _state.id,
      "emu",
      "avd",
      "name",
    ]).string();

    _maybeParseName(output).chain(O.map((newName) {
      _state = _state.copyWith(name: newName);
    }));
  }
}

final _maybeParseName = stringOption
    .compose(O.map(splitLines))
    .compose(O.filter((parts) => parts.length == 2))
    .compose(O.filter((parts) => parts.last == "OK"))
    .compose(O.map((parts) => parts.first));
