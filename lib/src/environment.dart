import 'dart:convert';
import 'dart:io';

import 'package:emulators/src/device.dart';
import 'package:emulators/src/utils/strings.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;

const _kDeviceJson = String.fromEnvironment('EMULATORS_DEVICE');
const _kConfigJson = String.fromEnvironment('EMULATORS_CONFIG');

class Environment {
  /// Get the current device from the EMULATORS_DEVICE environment variable.
  static Option<DeviceState> get device => O
      .fromNullable(Platform.environment['EMULATORS_DEVICE'])
      .chain(O.alt(() => stringOption(_kDeviceJson)))
      .chain(O.chainTryCatchK(json.decode))
      .chain(O.map((json) => DeviceState.fromJson(json)));

  /// Get the current config from the EMULATORS_CONFIG environment variable.
  static Option<Map<String, dynamic>> get config => O
      .fromNullable(Platform.environment['EMULATORS_CONFIG'])
      .chain(O.alt(() => stringOption(_kConfigJson)))
      .chain(O.chainTryCatchK((s) => json.decode(s) as Map<String, dynamic>));

  static Option<T> getOption<T>(String key) => config.extract<T>(key);

  static String? getString(String key) =>
      getOption<String>(key).chain(O.toNullable);

  static int? getInt(String key) => getOption<int>(key).chain(O.toNullable);

  static double? getDouble(String key) =>
      getOption<double>(key).chain(O.toNullable);
}
