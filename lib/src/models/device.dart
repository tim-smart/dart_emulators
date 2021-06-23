import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';

enum DevicePlatform {
  IOS,
  ANDROID,
  WEB,
}

@freezed
class Device with _$Device {
  factory Device({
    required String id,
    required String name,
    required DevicePlatform platform,
    @Default(false) bool booted,
    @Default(None()) Option<Process> process,
  }) = _Device;
}
