import 'dart:io';

import 'package:fpdt/option.dart' show Option, kNone;
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
  const Device._();

  const factory Device({
    required String id,
    required String name,
    required DevicePlatform platform,
    required bool emulator,
    @Default(false) bool booted,
    @JsonKey(ignore: true) @Default(kNone) Option<Process> process,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

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
