// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Device _$$_DeviceFromJson(Map<String, dynamic> json) => _$_Device(
      id: json['id'] as String,
      name: json['name'] as String,
      platform: $enumDecode(_$DevicePlatformEnumMap, json['platform']),
      emulator: json['emulator'] as bool,
      booted: json['booted'] as bool? ?? false,
    );

Map<String, dynamic> _$$_DeviceToJson(_$_Device instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'platform': _$DevicePlatformEnumMap[instance.platform],
      'emulator': instance.emulator,
      'booted': instance.booted,
    };

const _$DevicePlatformEnumMap = {
  DevicePlatform.IOS: 'IOS',
  DevicePlatform.ANDROID: 'ANDROID',
  DevicePlatform.WEB: 'WEB',
};
