part of "../device.dart";

class IosDeviceManager implements DeviceManager {
  const IosDeviceManager(this.toolchain);

  final Toolchain toolchain;

  @override
  Stream<Device> list() => Stream.fromFuture(toolchain.simctl([
        "list",
        "devices",
        "--json",
      ]).json())
          .flatMap<DeviceState>((out) => _parseDevices(out).chain(O.fold(
                () => Stream.empty(),
                (devices) => Stream.fromIterable(devices),
              )))
          .map((state) => Device.fromState(state, toolchain: toolchain))
          .handleError((_) => Stream.empty());
}

Option<List<DeviceState>> _parseDevices(Map<String, dynamic> json) =>
    O.some(json).extractMap('devices').chain(O.map((devices) => devices.values
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
        .toList()));

class IosDevice extends Device {
  IosDevice({
    required DeviceState state,
    required Toolchain toolchain,
  })  : assert(state.platform == DevicePlatform.ios),
        super(state: state, toolchain: toolchain);

  @override
  Future<void> boot() async {
    await _toolchain.simctl([
      "boot",
      _state.id,
    ]).string();

    _state = _state.copyWith(booted: true);
  }

  @override
  Future<void> shutdown() async {
    await _toolchain.simctl([
      "shutdown",
      _state.id,
    ]).string();

    await Future.delayed(Duration(seconds: 3));
    _state = _state.copyWith(booted: false);
  }

  @override
  Future<List<int>> screenshot() => _toolchain.simctl([
        'io',
        _state.id,
        'screenshot',
        '-',
      ]).binary();

  @override
  Future<void> cleanStatusBar() => _toolchain
      .simctl([
        "status_bar",
        _state.id,
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
      ])
      .string()
      .then((_) => Future.delayed(Duration(seconds: 2)));
}
