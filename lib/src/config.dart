import 'dart:convert';
import 'dart:io';

import 'package:fpdt/function.dart';
import 'package:fpdt/option.dart' as O;
import 'package:fpdt/task.dart' as T;
import 'package:fpdt/task_option.dart' as TO;
import 'package:emulators/emulators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as P;
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

TO.TaskOption<String> _which(String exec) => TO
    .tryCatch(() => process.run('which', [exec]))
    .chain(TO.filter((path) => path.isNotEmpty));

/// Build a Config instance, automatically resolving the path's that we need.
Future<Config> buildConfig() {
  final androidSdk = O.fromNullable(Platform.environment['ANDROID_SDK_ROOT']);

  final adbPath = _which('adb')
      .chain(TO.alt(() => androidSdk
          .chain(O.map((sdk) => P.join(sdk, 'platform-tools/adb')))
          .chain(TO.fromOption)))
      .chain(TO.getOrElse(() => 'adb'));

  final avdmanagerPath = androidSdk
      .chain(O.map((sdk) => P.join(sdk, 'cmdline-tools/latest/bin/avdmanager')))
      .chain(TO.fromOption)
      .chain(TO.alt(() => _which('avdmanager')))
      .chain(TO.getOrElse(() => 'avdmanager'));

  final emulatorPath = _which('emulator')
      .chain(TO.alt(() => androidSdk
          .chain(O.map((sdk) => P.join(sdk, 'emulator/emulator')))
          .chain(TO.fromOption)))
      .chain(TO.getOrElse(() => 'emulator'));

  final flutterPath = _which('flutter').chain(TO.getOrElse(() => 'flutter'));
  final xcrunPath = _which('xcrun').chain(TO.getOrElse(() => 'xcrun'));

  return T.sequence([
    adbPath,
    avdmanagerPath,
    emulatorPath,
    flutterPath,
    xcrunPath,
  ]).chain(T.map(
    (paths) => Config(
      adbPath: paths[0],
      avdmanagerPath: paths[1],
      emulatorPath: paths[2],
      flutterPath: paths[3],
      xcrunPath: paths[4],
    ),
  ))();
}

/// Get the current device from the EMULATORS_DEVICE environment variable.
O.Option<Device> currentDevice() => O
    .fromNullable(Platform.environment['EMULATORS_DEVICE'])
    .chain(O.chainTryCatchK(json.decode))
    .chain(O.map((json) => Device.fromJson(json)));
