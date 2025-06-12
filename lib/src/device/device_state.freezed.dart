// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceState {
  String get id;
  String get name;
  DevicePlatform get platform;
  bool get emulator;
  bool get booted; // ignore: invalid_annotation_target
  @JsonKey(includeFromJson: false, includeToJson: false)
  Option<Process> get process;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceStateCopyWith<DeviceState> get copyWith =>
      _$DeviceStateCopyWithImpl<DeviceState>(this as DeviceState, _$identity);

  /// Serializes this DeviceState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.emulator, emulator) ||
                other.emulator == emulator) &&
            (identical(other.booted, booted) || other.booted == booted) &&
            (identical(other.process, process) || other.process == process));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, platform, emulator, booted, process);

  @override
  String toString() {
    return 'DeviceState(id: $id, name: $name, platform: $platform, emulator: $emulator, booted: $booted, process: $process)';
  }
}

/// @nodoc
abstract mixin class $DeviceStateCopyWith<$Res> {
  factory $DeviceStateCopyWith(
          DeviceState value, $Res Function(DeviceState) _then) =
      _$DeviceStateCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      DevicePlatform platform,
      bool emulator,
      bool booted,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Option<Process> process});
}

/// @nodoc
class _$DeviceStateCopyWithImpl<$Res> implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._self, this._then);

  final DeviceState _self;
  final $Res Function(DeviceState) _then;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as DevicePlatform,
      emulator: null == emulator
          ? _self.emulator
          : emulator // ignore: cast_nullable_to_non_nullable
              as bool,
      booted: null == booted
          ? _self.booted
          : booted // ignore: cast_nullable_to_non_nullable
              as bool,
      process: null == process
          ? _self.process
          : process // ignore: cast_nullable_to_non_nullable
              as Option<Process>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceState extends DeviceState {
  const _DeviceState(
      {required this.id,
      required this.name,
      required this.platform,
      required this.emulator,
      this.booted = false,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.process = const None()})
      : super._();
  factory _DeviceState.fromJson(Map<String, dynamic> json) =>
      _$DeviceStateFromJson(json);

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
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Option<Process> process;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceStateCopyWith<_DeviceState> get copyWith =>
      __$DeviceStateCopyWithImpl<_DeviceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.emulator, emulator) ||
                other.emulator == emulator) &&
            (identical(other.booted, booted) || other.booted == booted) &&
            (identical(other.process, process) || other.process == process));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, platform, emulator, booted, process);

  @override
  String toString() {
    return 'DeviceState(id: $id, name: $name, platform: $platform, emulator: $emulator, booted: $booted, process: $process)';
  }
}

/// @nodoc
abstract mixin class _$DeviceStateCopyWith<$Res>
    implements $DeviceStateCopyWith<$Res> {
  factory _$DeviceStateCopyWith(
          _DeviceState value, $Res Function(_DeviceState) _then) =
      __$DeviceStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DevicePlatform platform,
      bool emulator,
      bool booted,
      @JsonKey(includeFromJson: false, includeToJson: false)
      Option<Process> process});
}

/// @nodoc
class __$DeviceStateCopyWithImpl<$Res> implements _$DeviceStateCopyWith<$Res> {
  __$DeviceStateCopyWithImpl(this._self, this._then);

  final _DeviceState _self;
  final $Res Function(_DeviceState) _then;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? platform = null,
    Object? emulator = null,
    Object? booted = null,
    Object? process = null,
  }) {
    return _then(_DeviceState(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as DevicePlatform,
      emulator: null == emulator
          ? _self.emulator
          : emulator // ignore: cast_nullable_to_non_nullable
              as bool,
      booted: null == booted
          ? _self.booted
          : booted // ignore: cast_nullable_to_non_nullable
              as bool,
      process: null == process
          ? _self.process
          : process // ignore: cast_nullable_to_non_nullable
              as Option<Process>,
    ));
  }
}

// dart format on
