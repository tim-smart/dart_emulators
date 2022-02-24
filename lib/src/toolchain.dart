import 'dart:convert';
import 'dart:io';

import 'package:emulators/src/device.dart';
import 'package:emulators/src/utils/process.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:fpdt/task.dart' as T;
import 'package:fpdt/task_option.dart' as TO;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as P;

part 'toolchain.freezed.dart';

TO.TaskOption<String> _which(String exec) => TO
    .tryCatch(() => run('which', [exec]).string())
    .p(TO.filter((path) => path.isNotEmpty));

final _androidSdk = O.fromNullable(Platform.environment['ANDROID_SDK_ROOT']);

final _adbPath = _which('adb')
    .p(TO.alt(() => _androidSdk
        .p(O.map((sdk) => P.join(sdk, 'platform-tools/adb')))
        .p(TO.fromOption)))
    .p(TO.getOrElse(() => 'adb'));

final _avdmanagerPath = _androidSdk
    .p(O.map((sdk) => P.join(sdk, 'cmdline-tools/latest/bin/avdmanager')))
    .p(TO.fromOption)
    .p(TO.alt(() => _which('avdmanager')))
    .p(TO.getOrElse(() => 'avdmanager'));

final _emulatorPath = _which('emulator')
    .p(TO.alt(() => _androidSdk
        .p(O.map((sdk) => P.join(sdk, 'emulator/emulator')))
        .p(TO.fromOption)))
    .p(TO.getOrElse(() => 'emulator'));

final _flutterPath = _which('flutter').p(TO.getOrElse(() => 'flutter'));
final _xcrunPath = _which('xcrun').p(TO.getOrElse(() => 'xcrun'));

/// [Toolchain] represents the CLI tools we will use.
@freezed
class Toolchain with _$Toolchain {
  const Toolchain._();

  const factory Toolchain({
    required String adbPath,
    required String avdmanagerPath,
    required String emulatorPath,
    required String flutterPath,
    required String xcrunPath,
  }) = _Toolchain;

  static Future<Toolchain> build() => T.sequence([
        _adbPath,
        _avdmanagerPath,
        _emulatorPath,
        _flutterPath,
        _xcrunPath,
      ]).p(T.map(
        (paths) => Toolchain(
          adbPath: paths[0],
          avdmanagerPath: paths[1],
          emulatorPath: paths[2],
          flutterPath: paths[3],
          xcrunPath: paths[4],
        ),
      ))();

  /// Wrapper for the `flutter` CLI tool.
  ProcessRunner flutter(
    List<String> args, {
    Map<String, String>? env,
  }) =>
      run(flutterPath, args, env: env);

  /// Wrapper for the `flutter` CLI tools. Runs a command and sets the
  /// `EMULATORS_DEVICE` environment variable so you can easily take screenshots
  /// etc.
  ProcessRunner flutterWithDevice(
    String command,
    DeviceState device, {
    List<String> args = const [],
    Map<String, dynamic> config = const {},
  }) {
    final configJson = json.encode(config);
    final deviceJson = json.encode(device.toJson());

    return run(flutterPath, [
      command,
      '-d',
      device.id,
      '--dart-define',
      'EMULATORS_CONFIG=$configJson',
      '--dart-define',
      'EMULATORS_DEVICE=$deviceJson',
      ...args,
    ], env: {
      'EMULATORS_CONFIG': configJson,
      'EMULATORS_DEVICE': deviceJson,
    });
  }

  /// Wrapper for the `emulator` CLI tools from the Android SDK
  ProcessRunner emulator(List<String> args) => run(emulatorPath, args);

  /// Wrapper for the `adb` CLI tool.
  ProcessRunner adb(List<String> args) => run(adbPath, args);

  /// Wrapper for the `avdmanager` CLI tool from the Android SDK
  ProcessRunner avdmanager(List<String> args) => run(avdmanagerPath, args);

  /// Wrapper for the `simctl` CLI tool from xcode
  ProcessRunner simctl(List<String> args) => run(xcrunPath, [
        "simctl",
        ...args,
      ]);
}
