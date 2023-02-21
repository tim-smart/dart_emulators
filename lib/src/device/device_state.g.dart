// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeviceState _$$_DeviceStateFromJson(Map<String, dynamic> json) =>
    _$_DeviceState(
      id: json['id'] as String,
      name: json['name'] as String,
      platform: $enumDecode(_$DevicePlatformEnumMap, json['platform']),
      emulator: json['emulator'] as bool,
      booted: json['booted'] as bool? ?? false,
    );

Map<String, dynamic> _$$_DeviceStateToJson(_$_DeviceState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'platform': _$DevicePlatformEnumMap[instance.platform]!,
      'emulator': instance.emulator,
      'booted': instance.booted,
    };

const _$DevicePlatformEnumMap = {
  DevicePlatform.ios: 'ios',
  DevicePlatform.android: 'android',
  DevicePlatform.unimplemented: 'unimplemented',
};
