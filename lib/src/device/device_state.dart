import 'dart:io';

import 'package:elemental/elemental.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_state.freezed.dart';
part 'device_state.g.dart';

/// Indicates what platform the device is for.
enum DevicePlatform {
  ios,
  android,
  unimplemented,
}

/// Represents an emulator or real device.
@freezed
class DeviceState with _$DeviceState {
  const DeviceState._();

  const factory DeviceState({
    required String id,
    required String name,
    required DevicePlatform platform,
    required bool emulator,
    @Default(false) bool booted,
    // ignore: invalid_annotation_target
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(None())
    Option<Process> process,
  }) = _DeviceState;

  factory DeviceState.fromJson(Map<String, dynamic> json) =>
      _$DeviceStateFromJson(json);

  /// Check whether this device has a matching id or name to another device
  /// instance.
  bool similar(DeviceState other) {
    final props = [id, name];
    return [
      other.id,
      other.name,
    ].any((p) => props.contains(p));
  }
}
