import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:emulators/emulators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:emulators/src/utils/process.dart' as process;

part 'config.freezed.dart';

/// Config represents the resolved paths for the CLI tools we will use.
@freezed
class Config with _$Config {
  const factory Config({
    required String adbPath,
    required String avdmanagerPath,
    required String emulatorPath,
    required String flutterPath,
    required String xcrunPath,
  }) = _Config;
}

Future<Option<String>> _which(String exec) => process.run('which', [exec]).then(
      (path) => path.isEmpty ? none() : some(path),
      onError: (_) => none(),
    );

/// Build a Config instance, automatically resolving the path's that we need.
Future<Config> buildConfig() async {
  final androidSdk = optionOf(Platform.environment['ANDROID_SDK_ROOT']);

  final adbPath = (await _which('adb'))
      .alt(() => androidSdk.map((sdk) => p.join(sdk, 'platform-tools/adb')))
      .getOrElse(() => 'adb');

  final avdmanagerPath = await androidSdk
      .map((sdk) => p.join(sdk, 'cmdline-tools/latest/bin/avdmanager'))
      .match(
        (path) => Future.value(some(path)),
        () => _which('avdmanager'),
      )
      .then((o) => o.getOrElse(() => 'avdmanager'));

  final emulatorPath = (await _which('emulator'))
      .alt(() => androidSdk.map((sdk) => p.join(sdk, 'emulator/emulator')))
      .getOrElse(() => 'emulator');

  final flutterPath = (await _which('flutter')).getOrElse(() => 'flutter');

  final xcrunPath = (await _which('xcrun')).getOrElse(() => 'xcrun');

  return Config(
    adbPath: adbPath,
    avdmanagerPath: avdmanagerPath,
    emulatorPath: emulatorPath,
    flutterPath: flutterPath,
    xcrunPath: xcrunPath,
  );
}

/// Get the current device from the EMULATORS_DEVICE environment variable.
Option<Device> currentDevice() =>
    optionOf(Platform.environment['EMULATORS_DEVICE'])
        .flatMap((s) => Option.tryCatch(() => json.decode(s)))
        .map((json) => Device.fromJson(json));
