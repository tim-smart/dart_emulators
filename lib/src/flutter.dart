import 'dart:io';

import 'package:emulators/src/device.dart';
import 'package:emulators/src/device_state.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:emulators/src/utils/adb.dart';
import 'package:emulators/src/utils/process.dart';
import 'package:emulators/src/utils/strings.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:rxdart/rxdart.dart';

class Flutter {
  const Flutter(this.toolchain);

  final Toolchain toolchain;

  Stream<Device> running({bool onlyEmulators = true}) =>
      Stream.fromFuture(toolchain.flutter(['devices']).string())
          .flatMap((out) => Stream.fromIterable(splitLines(out)))
          .flatMap<Device>((line) => parseDevicesLine(line).chain(O.fold(
                () => Stream.empty(),
                (d) => Stream.value(Device.fromState(d, toolchain: toolchain)),
              )))
          .where((d) => onlyEmulators ? d.state.emulator : true)
          .asyncMap((d) async {
        await d.maybeResolveName();
        return d;
      });

  /// Wrapper for the `flutter drive` CLI command. Runs it on the given [DeviceState],
  /// and sets the `EMULATORS_DEVICE` environment variable so you can easily take
  /// screenshots etc. in your flutter_driver test script.
  Future<Process> drive(
    Device device,
    String target, {
    List<String> args = const [],
    Map<String, dynamic> config = const {},
  }) =>
      toolchain
          .flutterWithDevice(
            'drive',
            device.state,
            args: [
              '--target=$target',
              ...args,
            ],
            config: config,
          )
          .process();

  /// Wrapper for the `flutter test` CLI command. Runs it on the given [DeviceState],
  /// and sets the `EMULATORS_DEVICE` environment variable so you can easily take
  /// screenshots etc. in your integration test script.
  ProcessRunner test(
    Device device,
    String target, {
    List<String> args = const [],
    Map<String, dynamic> config = const {},
  }) =>
      toolchain.flutterWithDevice(
        'test',
        device.state,
        args: [target, ...args],
        config: config,
      );
}
