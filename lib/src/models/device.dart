import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';
part 'device.g.dart';

enum DevicePlatform {
  IOS,
  ANDROID,
  WEB,
}

@freezed
class Device with _$Device {
  const Device._();

  const factory Device({
    required String id,
    required String name,
    required DevicePlatform platform,
    required bool emulator,
    @Default(false) bool booted,
    @JsonKey(ignore: true) @Default(None()) Option<Process> process,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  bool similar(Device other) {
    final props = [id, name];
    return [
      other.id,
      other.name,
    ].any((p) => props.contains(p));
  }
}
