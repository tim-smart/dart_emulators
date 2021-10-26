import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';
part 'device.g.dart';

/// Indicates what platform the device is for.
enum DevicePlatform {
  IOS,
  ANDROID,
  WEB,
}

/// Represents an emulator or real device.
@freezed
class Device with _$Device {
  Device._();

  factory Device({
    required String id,
    required String name,
    required DevicePlatform platform,
    required bool emulator,
    @Default(false) bool booted,
    @JsonKey(ignore: true) @Default(None()) Option<Process> process,
    String? locale,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  late final Option<String> localeOption = optionOf(locale);
  late final Option<String> localeCountry =
      localeOption.bind((l) => optionOf(l.split('-').firstOrNull));
  late final Option<String> localeLanguage =
      localeOption.bind((l) => optionOf(l.split('-').lastOrNull));

  /// Check whether this device has a matching id or name to another device
  /// instance.
  bool similar(Device other) {
    final props = [id, name];
    return [
      other.id,
      other.name,
    ].any((p) => props.contains(p));
  }
}
