// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceState _$DeviceStateFromJson(Map<String, dynamic> json) {
  return _DeviceState.fromJson(json);
}

/// @nodoc
mixin _$DeviceState {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DevicePlatform get platform => throw _privateConstructorUsedError;
  bool get emulator => throw _privateConstructorUsedError;
  bool get booted =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  Option<Process> get process => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceStateCopyWith<DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceStateCopyWith<$Res> {
  factory $DeviceStateCopyWith(
          DeviceState value, $Res Function(DeviceState) then) =
      _$DeviceStateCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      DevicePlatform platform,
      bool emulator,
      bool booted,
      @JsonKey(ignore: true) Option<Process> process});
}

/// @nodoc
class _$DeviceStateCopyWithImpl<$Res> implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._value, this._then);

  final DeviceState _value;
  // ignore: unused_field
  final $Res Function(DeviceState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? platform = freezed,
    Object? emulator = freezed,
    Object? booted = freezed,
    Object? process = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as DevicePlatform,
      emulator: emulator == freezed
          ? _value.emulator
          : emulator // ignore: cast_nullable_to_non_nullable
              as bool,
      booted: booted == freezed
          ? _value.booted
          : booted // ignore: cast_nullable_to_non_nullable
              as bool,
      process: process == freezed
          ? _value.process
          : process // ignore: cast_nullable_to_non_nullable
              as Option<Process>,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceStateCopyWith<$Res>
    implements $DeviceStateCopyWith<$Res> {
  factory _$$_DeviceStateCopyWith(
          _$_DeviceState value, $Res Function(_$_DeviceState) then) =
      __$$_DeviceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      DevicePlatform platform,
      bool emulator,
      bool booted,
      @JsonKey(ignore: true) Option<Process> process});
}

/// @nodoc
class __$$_DeviceStateCopyWithImpl<$Res> extends _$DeviceStateCopyWithImpl<$Res>
    implements _$$_DeviceStateCopyWith<$Res> {
  __$$_DeviceStateCopyWithImpl(
      _$_DeviceState _value, $Res Function(_$_DeviceState) _then)
      : super(_value, (v) => _then(v as _$_DeviceState));

  @override
  _$_DeviceState get _value => super._value as _$_DeviceState;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? platform = freezed,
    Object? emulator = freezed,
    Object? booted = freezed,
    Object? process = freezed,
  }) {
    return _then(_$_DeviceState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as DevicePlatform,
      emulator: emulator == freezed
          ? _value.emulator
          : emulator // ignore: cast_nullable_to_non_nullable
              as bool,
      booted: booted == freezed
          ? _value.booted
          : booted // ignore: cast_nullable_to_non_nullable
              as bool,
      process: process == freezed
          ? _value.process
          : process // ignore: cast_nullable_to_non_nullable
              as Option<Process>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceState extends _DeviceState {
  const _$_DeviceState(
      {required this.id,
      required this.name,
      required this.platform,
      required this.emulator,
      this.booted = false,
      @JsonKey(ignore: true) this.process = kNone})
      : super._();

  factory _$_DeviceState.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceStateFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DevicePlatform platform;
  @override
  final bool emulator;
  @override
  @JsonKey()
  final bool booted;
// ignore: invalid_annotation_target
  @override
  @JsonKey(ignore: true)
  final Option<Process> process;

  @override
  String toString() {
    return 'DeviceState(id: $id, name: $name, platform: $platform, emulator: $emulator, booted: $booted, process: $process)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.platform, platform) &&
            const DeepCollectionEquality().equals(other.emulator, emulator) &&
            const DeepCollectionEquality().equals(other.booted, booted) &&
            const DeepCollectionEquality().equals(other.process, process));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(platform),
      const DeepCollectionEquality().hash(emulator),
      const DeepCollectionEquality().hash(booted),
      const DeepCollectionEquality().hash(process));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceStateCopyWith<_$_DeviceState> get copyWith =>
      __$$_DeviceStateCopyWithImpl<_$_DeviceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceStateToJson(this);
  }
}

abstract class _DeviceState extends DeviceState {
  const factory _DeviceState(
      {required final String id,
      required final String name,
      required final DevicePlatform platform,
      required final bool emulator,
      final bool booted,
      @JsonKey(ignore: true) final Option<Process> process}) = _$_DeviceState;
  const _DeviceState._() : super._();

  factory _DeviceState.fromJson(Map<String, dynamic> json) =
      _$_DeviceState.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  DevicePlatform get platform => throw _privateConstructorUsedError;
  @override
  bool get emulator => throw _privateConstructorUsedError;
  @override
  bool get booted => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  Option<Process> get process => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceStateCopyWith<_$_DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}
