part of '../platform_device.dart';

class UnimplementedDevice extends PlatformDevice {
  UnimplementedDevice({required this.state});

  @override
  final DeviceState state;

  @override
  DeviceIO<Unit> setState(DeviceState state) =>
      ZIO.fail(const DeviceError.unimplemented());

  @override
  DeviceIO<Unit> get boot => ZIO.fail(const DeviceError.unimplemented());

  @override
  DeviceIO<Unit> get shutdown => ZIO.fail(const DeviceError.unimplemented());

  @override
  DeviceIO<List<int>> get screenshot =>
      ZIO.fail(const DeviceError.unimplemented());

  @override
  DeviceIO<Unit> get cleanStatusBar =>
      ZIO.fail(const DeviceError.unimplemented());

  @override
  DeviceIO<Unit> get maybeResolveName =>
      ZIO.fail(const DeviceError.unimplemented());
}
