import 'package:emulators/src/device.dart';
import 'package:emulators/src/environment.dart';
import 'package:emulators/src/flutter.dart';
import 'package:emulators/src/screenshot_helper.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:rxdart/rxdart.dart';

class Emulators {
  Emulators({required this.toolchain});

  static Future<Emulators> build() async =>
      Emulators(toolchain: await Toolchain.build());

  final Toolchain toolchain;
  late final flutter = Flutter(toolchain);
  late final android = AndroidDeviceManager(toolchain);
  late final ios = IosDeviceManager(toolchain);

  /// Attempt to load the current device from the `EMULATORS_DEVICE` env variable.
  Option<Device> currentDevice() =>
      Environment.device.chain(O.map((state) => Device.fromState(
            state,
            toolchain: toolchain,
          )));

  /// List the available emulators
  Stream<Device> list() => Rx.merge([
        android.list(),
        ios.list(),
      ]);

  /// Attempt to shutdown all running emulators on the host.
  Future<void> shutdownAll() =>
      flutter.running().asyncMap((d) => d.shutdown()).forEach((_) {});

  ScreenshotHelper screenshotHelper({
    Device? device,
    required String iosPath,
    required String androidPath,
    List<String> suffixes = const [],
  }) =>
      ScreenshotHelper(
        device: device ??
            currentDevice().chain(O.fold(
              () => throw 'screenshotHelper: cannot find current device',
              (d) => d,
            )),
        androidPath: androidPath,
        iosPath: iosPath,
      );

  Future<void> Function(Future<void> Function(Device device)) forEach(
    List<String> nameOrIds, {
    Duration timeout = const Duration(minutes: 3),
  }) =>
      (process) => list()
              .where((d) =>
                  nameOrIds.contains(d.state.id) ||
                  nameOrIds.contains(d.state.name))
              .asyncMap((device) async {
            await device.boot();
            final bootedDevice = device.clone();

            await device.waitUntilRunning();
            await process(device);

            await bootedDevice.shutdown();
          }).forEach((_) {});
}
