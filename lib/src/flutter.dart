import 'dart:io';

import 'package:elemental/elemental.dart';
import 'package:emulators/src/device.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:emulators/src/utils/adb.dart';
import 'package:emulators/src/utils/strings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flutter.freezed.dart';

@freezed
abstract class FlutterError with _$FlutterError {
  const factory FlutterError.toolchainFailure({
    required String op,
    required String message,
  }) = FlutterErrorToolchainFailure;

  const factory FlutterError.deviceFailure({
    required DeviceState state,
    required String message,
  }) = FlutterErrorDeviceFailure;
}

typedef FlutterIO<A> = EIO<FlutterError, A>;

class Flutter {
  const Flutter(this.toolchain);
  final Toolchain toolchain;

  FlutterIO<IList<Device>> running({bool onlyEmulators = true}) =>
      FlutterIO.tryCatch(
        () => toolchain
            .flutter(['devices'])
            .string()
            .then((value) => _devicesFromOutput(toolchain, value)),
        (err, stackTrace) => FlutterError.toolchainFailure(
          op: 'running',
          message: '$err',
        ),
      )
          .map(
            (devices) => onlyEmulators
                ? devices.where((d) => d.state.emulator).toIList()
                : devices,
          )
          .tap((devices) => _resolveDeviceNames(devices).lift());

  /// Wrapper for the `flutter drive` CLI command. Runs it on the given [Device],
  /// and sets the `EMULATORS_DEVICE` environment variable so you can easily take
  /// screenshots etc. in your flutter_driver test script.
  FlutterIO<Process> drive(
    Device device,
    String target, {
    List<String> args = const [],
    Map<String, dynamic> config = const {},
  }) =>
      FlutterIO.tryCatch(
        () => toolchain
            .flutterWithDevice(
              'drive',
              device.state,
              args: [
                '--target=$target',
                ...args,
              ],
              config: config,
            )
            .process(),
        (err, stackTrace) => FlutterError.toolchainFailure(
          op: 'drive',
          message: '$err',
        ),
      );

  /// Wrapper for the `flutter test` CLI command. Runs it on the given [DeviceState],
  /// and sets the `EMULATORS_DEVICE` environment variable so you can easily take
  /// screenshots etc. in your integration test script.
  FlutterIO<Process> test(
    Device device,
    String target, {
    List<String> args = const [],
    Map<String, dynamic> config = const {},
  }) =>
      FlutterIO.tryCatch(
        () => toolchain
            .flutterWithDevice(
              'test',
              device.state,
              args: [target, ...args],
              config: config,
            )
            .process(),
        (err, stackTrace) => FlutterError.toolchainFailure(
          op: 'test',
          message: '$err',
        ),
      );
}

// === helpers ===

final _devicesFromOutput = (Toolchain tc, String out) => splitLines(out)
    .expand<Device>((line) => parseDevicesLine(line).match(
          () => [],
          (d) => [Device(state: d, toolchain: tc)],
        ))
    .toIList();

final _resolveDeviceNames = (IList<Device> devices) => devices
    .map(
      (d) => d.platform.maybeResolveName.mapError(
        (_) => FlutterError.deviceFailure(
          state: d.state,
          message: _.toString(),
        ),
      ),
    )
    .collectParDiscard;
