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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceState _$DeviceStateFromJson(Map<String, dynamic> json) {
  return _DeviceState.fromJson(json);
}

/// @nodoc
class _$DeviceStateTearOff {
  const _$DeviceStateTearOff();

  _DeviceState call(
      {required String id,
      required String name,
      required DevicePlatform platform,
      required bool emulator,
      bool booted = false,
      @JsonKey(ignore: true) Option<Process> process = kNone}) {
    return _DeviceState(
      id: id,
      name: name,
      platform: platform,
      emulator: emulator,
      booted: booted,
      process: process,
    );
  }

  DeviceState fromJson(Map<String, Object?> json) {
    return DeviceState.fromJson(json);
  }
}

/// @nodoc
const $DeviceState = _$DeviceStateTearOff();

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
abstract class _$DeviceStateCopyWith<$Res>
    implements $DeviceStateCopyWith<$Res> {
  factory _$DeviceStateCopyWith(
          _DeviceState value, $Res Function(_DeviceState) then) =
      __$DeviceStateCopyWithImpl<$Res>;
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
class __$DeviceStateCopyWithImpl<$Res> extends _$DeviceStateCopyWithImpl<$Res>
    implements _$DeviceStateCopyWith<$Res> {
  __$DeviceStateCopyWithImpl(
      _DeviceState _value, $Res Function(_DeviceState) _then)
      : super(_value, (v) => _then(v as _DeviceState));

  @override
  _DeviceState get _value => super._value as _DeviceState;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? platform = freezed,
    Object? emulator = freezed,
    Object? booted = freezed,
    Object? process = freezed,
  }) {
    return _then(_DeviceState(
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
  @JsonKey()
  @override
  final bool booted;
  @override // ignore: invalid_annotation_target
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
            other is _DeviceState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.platform, platform) &&
            const DeepCollectionEquality().equals(other.emulator, emulator) &&
            const DeepCollectionEquality().equals(other.booted, booted) &&
            const DeepCollectionEquality().equals(other.process, process));
  }

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
  _$DeviceStateCopyWith<_DeviceState> get copyWith =>
      __$DeviceStateCopyWithImpl<_DeviceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceStateToJson(this);
  }
}

abstract class _DeviceState extends DeviceState {
  const factory _DeviceState(
      {required String id,
      required String name,
      required DevicePlatform platform,
      required bool emulator,
      bool booted,
      @JsonKey(ignore: true) Option<Process> process}) = _$_DeviceState;
  const _DeviceState._() : super._();

  factory _DeviceState.fromJson(Map<String, dynamic> json) =
      _$_DeviceState.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DevicePlatform get platform;
  @override
  bool get emulator;
  @override
  bool get booted;
  @override // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  Option<Process> get process;
  @override
  @JsonKey(ignore: true)
  _$DeviceStateCopyWith<_DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}
