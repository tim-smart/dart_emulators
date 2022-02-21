import 'dart:io';

import 'package:emulators/src/device.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:emulators/src/utils/adb.dart';
import 'package:emulators/src/utils/process.dart';
import 'package:emulators/src/utils/strings.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:fpdt/reader_task_either.dart' as RTE;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flutter.freezed.dart';

@freezed
class FlutterError with _$FlutterError {
  const factory FlutterError.toolchainFailure({
    required String op,
    required String message,
    required StackTrace stackTrace,
  }) = FlutterErrorToolchainFailure;
}

typedef FlutterOp<R> = ReaderTaskEither<Toolchain, FlutterError, R>;

final _devicesFromOutput = (String out) => (Toolchain tc) => splitLines(out)
    .expand<Device>((line) => parseDevicesLine(line).p(O.fold(
          () => [],
          (d) => [Device(state: d, toolchain: tc)],
        )))
    .toIList();

FlutterOp<IList<Device>> running({bool onlyEmulators = true}) => RTE
    .ask<Toolchain, FlutterError>()
    .p(RTE.chainTryCatchK(
      (tc) => tc.flutter(['devices']).string(),
      (err, stackTrace) => FlutterError.toolchainFailure(
        op: 'running',
        message: '$err',
        stackTrace: stackTrace,
      ),
    ))
    .p(RTE.flatMapReader(_devicesFromOutput))
    .p(RTE.map((devices) => onlyEmulators
        ? devices.where((d) => d.state.emulator).toIList()
        : devices))
    .p(RTE.tap(
      (devices) => Future.wait(devices.map((d) => d.maybeResolveName())),
    ));

/// Wrapper for the `flutter drive` CLI command. Runs it on the given [Device],
/// and sets the `EMULATORS_DEVICE` environment variable so you can easily take
/// screenshots etc. in your flutter_driver test script.
FlutterOp<Process> drive(
  Device device,
  String target, {
  List<String> args = const [],
  Map<String, dynamic> config = const {},
}) =>
    RTE.ask<Toolchain, FlutterError>().p(RTE.chainTryCatchK(
          (tc) => tc
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
            stackTrace: stackTrace,
          ),
        ));

/// Wrapper for the `flutter test` CLI command. Runs it on the given [DeviceState],
/// and sets the `EMULATORS_DEVICE` environment variable so you can easily take
/// screenshots etc. in your integration test script.
FlutterOp<Process> test(
  Device device,
  String target, {
  List<String> args = const [],
  Map<String, dynamic> config = const {},
}) =>
    RTE.ask<Toolchain, FlutterError>().p(RTE.chainTryCatchK(
          (tc) => tc
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
            stackTrace: stackTrace,
          ),
        ));
