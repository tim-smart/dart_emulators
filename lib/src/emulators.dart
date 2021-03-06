import 'dart:io';

import 'package:emulators/src/device.dart';
import 'package:emulators/src/device/ops.dart' as Ops;
import 'package:emulators/src/environment.dart';
import 'package:emulators/src/flutter.dart' as Flutter;
import 'package:emulators/src/screenshot_helper.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:fpdt/either.dart' as E;
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;

class Emulators {
  Emulators({required this.toolchain});

  static Future<Emulators> build() async =>
      Emulators(toolchain: await Toolchain.build());

  final Toolchain toolchain;

  /// Attempt to load the current device from the `EMULATORS_DEVICE` env variable.
  Option<Device> currentDevice() =>
      Environment.device.p(O.map((state) => Device(
            state: state,
            toolchain: toolchain,
          )));

  /// List the available emulators
  Future<IList<Device>> list() => Ops.list(toolchain)().then(E.unwrap);

  /// List the running emulators
  Future<IList<Device>> running({bool onlyEmulators = true}) =>
      Flutter.running(onlyEmulators: onlyEmulators)(toolchain)().then(E.unwrap);

  /// Flutter drive helper
  Future<Process> drive(
    Device device,
    String target, {
    List<String> args = const [],
    Map<String, dynamic> config = const {},
  }) =>
      Flutter.drive(
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
      Flutter.test(
        device,
        target,
        args: args,
        config: config,
      )(toolchain)()
          .then(E.unwrap);

  /// Attempt to shutdown all running emulators on the host.
  Future<void> shutdownAll() => Ops.shutdownAll(toolchain)().then(E.unwrap);

  ScreenshotHelper screenshotHelper({
    Device? device,
    required String iosPath,
    required String androidPath,
    List<String> suffixes = const [],
  }) =>
      ScreenshotHelper(
        device: device ??
            currentDevice().p(O.fold(
              () => throw 'screenshotHelper: cannot find current device',
              (d) => d,
            )),
        androidPath: androidPath,
        iosPath: iosPath,
        suffixes: suffixes,
      );

  Future<void> Function(Ops.ProcessDevice process) forEach(
    Iterable<String> nameOrIds, {
    Duration timeout = const Duration(minutes: 3),
  }) =>
      (process) => Ops.forEach(
            nameOrIds: nameOrIds,
            timeout: timeout,
            process: process,
          )(toolchain)()
              .then(E.unwrap);
}
