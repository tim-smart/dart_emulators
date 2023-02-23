import 'dart:io';

import 'package:elemental/elemental.dart';
import 'package:emulators/src/device.dart';
import 'package:emulators/src/environment.dart';
import 'package:emulators/src/flutter.dart';
import 'package:emulators/src/screenshot_helper.dart';
import 'package:emulators/src/toolchain.dart';

class Emulators {
  Emulators({required this.toolchain});

  static Future<Emulators> build() async =>
      Emulators(toolchain: await Toolchain.build());

  final Toolchain toolchain;
  late final flutter = Flutter(toolchain);

  /// Attempt to load the current device from the `EMULATORS_DEVICE` env variable.
  Option<Device> currentDevice() => Environment.device.map((state) => Device(
        state: state,
        toolchain: toolchain,
      ));

  /// List the available emulators
  Future<IList<Device>> list() =>
      Device.list.provide(toolchain).runFutureOrThrow();

  /// List the running emulators
  Future<IList<Device>> running({bool onlyEmulators = true}) =>
      flutter.running(onlyEmulators: onlyEmulators).runFutureOrThrow();

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
          )
          .runFutureOrThrow();

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
          )
          .runFutureOrThrow();

  /// Attempt to shutdown all running emulators on the host.
  Future<void> shutdownAll() =>
      Device.shutdownAll.provide(toolchain).runFuture();

  ScreenshotHelper screenshotHelper({
    Device? device,
    required String iosPath,
    required String androidPath,
    List<String> suffixes = const [],
    bool disable = false,
  }) =>
      ScreenshotHelper(
        device: disable
            ? null
            : device ??
                currentDevice().match(
                  () => throw 'screenshotHelper: cannot find current device',
                  (d) => d,
                ),
        androidPath: androidPath,
        iosPath: iosPath,
        suffixes: suffixes,
      );

  Future<void> Function(Future<void> Function(Device device) process) forEach(
    Iterable<String> nameOrIds, {
    Duration timeout = const Duration(minutes: 3),
  }) =>
      (process) => Device.forEach(
            nameOrIds: nameOrIds,
            timeout: timeout,
            process: process,
          ).provide(toolchain).runFuture();
}
