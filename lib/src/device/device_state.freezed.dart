// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$DeviceStateCopyWithImpl<$Res, DeviceState>;
  @useResult
  $Res call(
      {String id,
      String name,
      DevicePlatform platform,
      bool emulator,
      bool booted,
      @JsonKey(ignore: true) Option<Process> process});
}

/// @nodoc
class _$DeviceStateCopyWithImpl<$Res, $Val extends DeviceState>
    implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? platform = null,
    Object? emulator = null,
    Object? booted = null,
    Object? process = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as DevicePlatform,
      emulator: null == emulator
          ? _value.emulator
          : emulator // ignore: cast_nullable_to_non_nullable
              as bool,
      booted: null == booted
          ? _value.booted
          : booted // ignore: cast_nullable_to_non_nullable
              as bool,
      process: null == process
          ? _value.process
          : process // ignore: cast_nullable_to_non_nullable
              as Option<Process>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceStateCopyWith<$Res>
    implements $DeviceStateCopyWith<$Res> {
  factory _$$_DeviceStateCopyWith(
          _$_DeviceState value, $Res Function(_$_DeviceState) then) =
      __$$_DeviceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DevicePlatform platform,
      bool emulator,
      bool booted,
      @JsonKey(ignore: true) Option<Process> process});
}

/// @nodoc
class __$$_DeviceStateCopyWithImpl<$Res>
    extends _$DeviceStateCopyWithImpl<$Res, _$_DeviceState>
    implements _$$_DeviceStateCopyWith<$Res> {
  __$$_DeviceStateCopyWithImpl(
      _$_DeviceState _value, $Res Function(_$_DeviceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? platform = null,
    Object? emulator = null,
    Object? booted = null,
    Object? process = null,
  }) {
    return _then(_$_DeviceState(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as DevicePlatform,
      emulator: null == emulator
          ? _value.emulator
          : emulator // ignore: cast_nullable_to_non_nullable
              as bool,
      booted: null == booted
          ? _value.booted
          : booted // ignore: cast_nullable_to_non_nullable
              as bool,
      process: null == process
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
      @JsonKey(ignore: true) this.process = const None()})
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.emulator, emulator) ||
                other.emulator == emulator) &&
            (identical(other.booted, booted) || other.booted == booted) &&
            (identical(other.process, process) || other.process == process));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, platform, emulator, booted, process);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceStateCopyWith<_$_DeviceState> get copyWith =>
      __$$_DeviceStateCopyWithImpl<_$_DeviceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceStateToJson(
      this,
    );
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
  _$$_DeviceStateCopyWith<_$_DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}
