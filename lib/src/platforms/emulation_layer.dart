import 'package:emulators/src/models/device.dart';

abstract class EmulationLayer {
  Future<List<Device>> listDevices();
  Future<void> cleanStatusBar(Device device);
  Future<Device> boot(Device device);
  Future<Device> shutdown(Device device);
  Future<List<int>> screenshot(Device device);
  Future<Device> updateDeviceName(Device device);
}
