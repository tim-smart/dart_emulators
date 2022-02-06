import 'dart:convert';
import 'dart:io';

import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/utils/strings.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';
import 'package:emulators/src/utils/process.dart';

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
    required bool verbose,
  }) = _Config;
}

Future<String?> _which(String exec, bool verbose) {
  return run('which', [exec], verbose).then(
    (str) => str.isNotEmpty ? str.replaceAll('\n', '') : null,
    // If `which` fails, return null.
    onError: (_) => null,
  );
}

/// Build a Config instance, automatically resolving the path's that we need.
Future<Config> buildConfig(bool verbose) async {
  final String? androidSdk = Platform.environment['ANDROID_SDK_ROOT'];

  final String adbPath = await _getAdbPath(androidSdk, verbose);

  final String avdManagerPath = await _getAvdManagerPath(androidSdk, verbose);

  final String emulatorPath = await _getEmulatorPath(androidSdk, verbose);

  final String? flutterPath = await _which('flutter', verbose);
  _checkPath('flutter', flutterPath);
  final String? xcrunPath = await _which('xcrun', verbose);
  _checkPath('xcrun', xcrunPath);

  return Config(
    adbPath: adbPath,
    avdmanagerPath: avdManagerPath,
    emulatorPath: emulatorPath,
    flutterPath: flutterPath!,
    xcrunPath: xcrunPath!,
    verbose: verbose,
  );
}

/// Get the current device from the EMULATORS_DEVICE environment variable.
Device currentDevice() {
  final String deviceJson = Platform.environment['EMULATORS_DEVICE']!;
  return Device.fromJson(jsonDecode(deviceJson));
}

const _kConfigJson = String.fromEnvironment('EMULATORS_CONFIG');

/// Get the current config from the EMULATORS_CONFIG environment variable.
Option<Map<String, dynamic>> configFromEnv() => O
    .fromNullable(Platform.environment['EMULATORS_CONFIG'])
    .chain(O.alt(() => stringOption(_kConfigJson)))
    .chain(O.chainTryCatchK((s) => json.decode(s) as Map<String, dynamic>));

Option<T> Function(String key) getOption<T>() =>
    (String key) => configFromEnv().extract<T>(key);

T? Function(String key) get<T>() => getOption<T>().compose(O.toNullable);

final getString = get<String>();
final getInt = get<int>();
final getDouble = get<double>();

Future<String> _getAdbPath(String? androidSdk, bool verbose) async {
  String? path = await _which('adb', verbose);
  if (path != null) {
    return path;
  }
  if (androidSdk != null) {
    return join(androidSdk, 'platform-tools', 'adb');
  }
  throw AssertionError(_execErrorMessage('adb'));
}

Future<String> _getAvdManagerPath(String? androidSdk, bool verbose) async {
  if (androidSdk != null) {
    return join(androidSdk, 'cmdline-tools', 'latest', 'bin', 'avdmanager');
  }
  final String? path = await _which('avdmanager', verbose);
  _checkPath('avdManager', path);
  return path!;
}

Future<String> _getEmulatorPath(String? androidSdk, bool verbose) async {
  if (androidSdk != null) {
    return join(androidSdk, 'cmdline-tools', 'emulator', 'emulator');
  }
  final String? path = await _which('emulator', verbose);
  _checkPath('emulator', path);
  return path!;
}

void _checkPath(String exec, String? path) {
  assert(path != null, _execErrorMessage(exec));
}

String _execErrorMessage(String exec) =>
    'Could not find the `$exec` executable. Make sure it is added to your '
    'system\'s path.';
