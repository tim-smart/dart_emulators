import 'dart:convert';
import 'dart:io';

import 'package:elemental/elemental.dart';
import 'package:emulators/src/device.dart';
import 'package:emulators/src/utils/strings.dart';

const _kDeviceJson = String.fromEnvironment('EMULATORS_DEVICE');
const _kConfigJson = String.fromEnvironment('EMULATORS_CONFIG');

Option<Map<String, dynamic>> _parseJson(String s) =>
    Option.tryCatch(() => json.decode(s));

class Environment {
  /// Get the current device from the EMULATORS_DEVICE environment variable.
  static Option<DeviceState> get device => Platform.environment
      .lookup('EMULATORS_DEVICE')
      .alt(() => stringOption(_kDeviceJson))
      .flatMap(_parseJson)
      .map((json) => DeviceState.fromJson(json));

  /// Get the current config from the EMULATORS_CONFIG environment variable.
  static Option<Map<String, dynamic>> get config => Platform.environment
      .lookup('EMULATORS_CONFIG')
      .alt(() => stringOption(_kConfigJson))
      .flatMap(_parseJson);

  static Option<T> getOption<T>(String key) => config.extract<T>(key);

  static String? getString(String key) => getOption<String>(key).toNullable();

  static int? getInt(String key) => getOption<int>(key).toNullable();

  static double? getDouble(String key) => getOption<double>(key).toNullable();
}
