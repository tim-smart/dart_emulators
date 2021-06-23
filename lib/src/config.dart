import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:emulators/emulators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:emulators/src/utils/process.dart' as process;

part 'config.freezed.dart';

@freezed
class Config with _$Config {
  factory Config({
    required String adbPath,
    required String emulatorPath,
    required String flutterPath,
    required String xcrunPath,
  }) = _Config;
}

Future<Option<String>> _which(String exec) => process.run('which', [exec]).then(
      (path) => path.isEmpty ? none() : some(path),
      onError: (_) => none(),
    );

Future<Config> buildConfig() async {
  final androidSdk = optionOf(Platform.environment['ANDROID_SDK_ROOT']);

  final adbPath = (await _which('adb'))
      .orElse(() => androidSdk.map((sdk) => p.join(sdk, 'platform-tools/adb')))
      .getOrElse(() => 'adb');

  final emulatorPath = (await _which('emulator'))
      .orElse(() => androidSdk.map((sdk) => p.join(sdk, 'emulator/emulator')))
      .getOrElse(() => 'emulator');

  final flutterPath = (await _which('flutter')).getOrElse(() => 'flutter');

  final xcrunPath = (await _which('xcrun')).getOrElse(() => 'xcrun');

  return Config(
    adbPath: adbPath,
    emulatorPath: emulatorPath,
    flutterPath: flutterPath,
    xcrunPath: xcrunPath,
  );
}

Option<Device> currentDevice() =>
    optionOf(Platform.environment['EMULATORS_DEVICE'])
        .bind((s) => catching(() => json.decode(s)).toOption())
        .map((json) => Device.fromJson(json));
