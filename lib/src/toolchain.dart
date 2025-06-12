import 'dart:convert';
import 'dart:io';

import 'package:elemental/elemental.dart';
import 'package:emulators/src/device.dart';
import 'package:emulators/src/utils/process.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as P;

part 'toolchain.freezed.dart';

IOOption<String> _which(String exec) =>
    IOOption.tryCatchOption(() => run('which', [exec]).string())
        .filter((result) => result.isNotEmpty);

final _androidSdk = Platform.environment
    .lookup('ANDROID_SDK_ROOT')
    .alt(() => Platform.environment.lookup('ANDROID_HOME'));

final _adbPath = _which('adb')
    .catchError(
      (_) => _androidSdk.map((sdk) => P.join(sdk, 'platform-tools/adb')),
    )
    .getOrElse((_) => 'adb');

final _avdmanagerPath = _which('avdmanager')
    .catchError((_) => _androidSdk
        .map((sdk) => P.join(sdk, 'cmdline-tools/latest/bin/avdmanager')))
    .getOrElse((_) => 'avdmanager');

final _emulatorPath = _which('emulator')
    .catchError(
      (_) => _androidSdk.map((sdk) => P.join(sdk, 'emulator/emulator')).toZIO,
    )
    .getOrElse((_) => 'emulator');

final _flutterPath = _which('flutter').getOrElse((_) => 'flutter');
final _xcrunPath = _which('xcrun').getOrElse((_) => 'xcrun');

/// [Toolchain] represents the CLI tools we will use.
@freezed
abstract class Toolchain with _$Toolchain {
  const Toolchain._();

  const factory Toolchain({
    required String adbPath,
    required String avdmanagerPath,
    required String emulatorPath,
    required String flutterPath,
    required String xcrunPath,
  }) = _Toolchain;

  static Future<Toolchain> build() => [
        _adbPath,
        _avdmanagerPath,
        _emulatorPath,
        _flutterPath,
        _xcrunPath,
      ]
          .collectPar
          .map(
            (paths) => Toolchain(
              adbPath: paths[0],
              avdmanagerPath: paths[1],
              emulatorPath: paths[2],
              flutterPath: paths[3],
              xcrunPath: paths[4],
            ),
          )
          .runFutureOrThrow();

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
