import 'dart:io';

import 'package:emulators/src/device.dart';
import 'package:emulators/src/environment.dart';
import 'package:emulators/src/flutter.dart' as flutter;
import 'package:emulators/src/screenshot_helper.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:fpdt/either.dart' as E;
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:rxdart/rxdart.dart';

class Emulators {
  Emulators({required this.toolchain});

  static Future<Emulators> build() async =>
      Emulators(toolchain: await Toolchain.build());

  final Toolchain toolchain;

  /// Attempt to load the current device from the `EMULATORS_DEVICE` env variable.
  Option<Device> currentDevice() =>
      Environment.device.chain(O.map((state) => Device(
            state: state,
            toolchain: toolchain,
          )));

  /// List the available emulators
  Future<IList<Device>> list() => listOp(toolchain)().then(E.unwrap);

  /// List the running emulators
  Future<IList<Device>> running({bool onlyEmulators = true}) =>
      flutter.running(onlyEmulators: onlyEmulators)(toolchain)().then(E.unwrap);

  /// Flutter drive helper
  Future<Process> drive(
    Device device,
    String target, {
    List<String> args = const [],
    Map<String, dynamic> config = const {},
  }) =>
      flutter
          .drive(
            device,
            target,
            args: args,
            config: config,
          )(toolchain)()
          .then(E.unwrap);

  /// Flutter test helper
  Future<Process> test(
    Device device,
    String target, {
    List<String> args = const [],
    Map<String, dynamic> config = const {},
  }) =>
      flutter
          .test(
            device,
            target,
            args: args,
            config: config,
          )(toolchain)()
          .then(E.unwrap);

  /// Attempt to shutdown all running emulators on the host.
  Future<void> shutdownAll() => shutdownAllOp(toolchain)().then(E.unwrap);

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
