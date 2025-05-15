// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceError {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DeviceError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeviceError()';
  }
}

/// @nodoc
class $DeviceErrorCopyWith<$Res> {
  $DeviceErrorCopyWith(DeviceError _, $Res Function(DeviceError) __);
}

/// @nodoc

class DeviceErrorToolchainFailure implements DeviceError {
  const DeviceErrorToolchainFailure(
      {required this.op, required this.command, required this.message});

  final String op;
  final String command;
  final String message;

  /// Create a copy of DeviceError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceErrorToolchainFailureCopyWith<DeviceErrorToolchainFailure>
      get copyWith => _$DeviceErrorToolchainFailureCopyWithImpl<
          DeviceErrorToolchainFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceErrorToolchainFailure &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.command, command) || other.command == command) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, op, command, message);

  @override
  String toString() {
    return 'DeviceError.toolchainFailure(op: $op, command: $command, message: $message)';
  }
}

/// @nodoc
abstract mixin class $DeviceErrorToolchainFailureCopyWith<$Res>
    implements $DeviceErrorCopyWith<$Res> {
  factory $DeviceErrorToolchainFailureCopyWith(
          DeviceErrorToolchainFailure value,
          $Res Function(DeviceErrorToolchainFailure) _then) =
      _$DeviceErrorToolchainFailureCopyWithImpl;
  @useResult
  $Res call({String op, String command, String message});
}

/// @nodoc
class _$DeviceErrorToolchainFailureCopyWithImpl<$Res>
    implements $DeviceErrorToolchainFailureCopyWith<$Res> {
  _$DeviceErrorToolchainFailureCopyWithImpl(this._self, this._then);

  final DeviceErrorToolchainFailure _self;
  final $Res Function(DeviceErrorToolchainFailure) _then;

  /// Create a copy of DeviceError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? op = null,
    Object? command = null,
    Object? message = null,
  }) {
    return _then(DeviceErrorToolchainFailure(
      op: null == op
          ? _self.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      command: null == command
          ? _self.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DeviceErrorProcessKillFailure implements DeviceError {
  const DeviceErrorProcessKillFailure(
      {required this.op, required this.message});

  final String op;
  final String message;

  /// Create a copy of DeviceError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceErrorProcessKillFailureCopyWith<DeviceErrorProcessKillFailure>
      get copyWith => _$DeviceErrorProcessKillFailureCopyWithImpl<
          DeviceErrorProcessKillFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceErrorProcessKillFailure &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, op, message);

  @override
  String toString() {
    return 'DeviceError.processKillFailure(op: $op, message: $message)';
  }
}

/// @nodoc
abstract mixin class $DeviceErrorProcessKillFailureCopyWith<$Res>
    implements $DeviceErrorCopyWith<$Res> {
  factory $DeviceErrorProcessKillFailureCopyWith(
          DeviceErrorProcessKillFailure value,
          $Res Function(DeviceErrorProcessKillFailure) _then) =
      _$DeviceErrorProcessKillFailureCopyWithImpl;
  @useResult
  $Res call({String op, String message});
}

/// @nodoc
class _$DeviceErrorProcessKillFailureCopyWithImpl<$Res>
    implements $DeviceErrorProcessKillFailureCopyWith<$Res> {
  _$DeviceErrorProcessKillFailureCopyWithImpl(this._self, this._then);

  final DeviceErrorProcessKillFailure _self;
  final $Res Function(DeviceErrorProcessKillFailure) _then;

  /// Create a copy of DeviceError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? op = null,
    Object? message = null,
  }) {
    return _then(DeviceErrorProcessKillFailure(
      op: null == op
          ? _self.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DeviceErrorFlutterFailure implements DeviceError {
  const DeviceErrorFlutterFailure({required this.op, required this.error});

  final String op;
  final FlutterError error;

  /// Create a copy of DeviceError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceErrorFlutterFailureCopyWith<DeviceErrorFlutterFailure> get copyWith =>
      _$DeviceErrorFlutterFailureCopyWithImpl<DeviceErrorFlutterFailure>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceErrorFlutterFailure &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, op, error);

  @override
  String toString() {
    return 'DeviceError.flutterFailure(op: $op, error: $error)';
  }
}

/// @nodoc
abstract mixin class $DeviceErrorFlutterFailureCopyWith<$Res>
    implements $DeviceErrorCopyWith<$Res> {
  factory $DeviceErrorFlutterFailureCopyWith(DeviceErrorFlutterFailure value,
          $Res Function(DeviceErrorFlutterFailure) _then) =
      _$DeviceErrorFlutterFailureCopyWithImpl;
  @useResult
  $Res call({String op, FlutterError error});

  $FlutterErrorCopyWith<$Res> get error;
}

/// @nodoc
class _$DeviceErrorFlutterFailureCopyWithImpl<$Res>
    implements $DeviceErrorFlutterFailureCopyWith<$Res> {
  _$DeviceErrorFlutterFailureCopyWithImpl(this._self, this._then);

  final DeviceErrorFlutterFailure _self;
  final $Res Function(DeviceErrorFlutterFailure) _then;

  /// Create a copy of DeviceError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? op = null,
    Object? error = null,
  }) {
    return _then(DeviceErrorFlutterFailure(
      op: null == op
          ? _self.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as FlutterError,
    ));
  }

  /// Create a copy of DeviceError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlutterErrorCopyWith<$Res> get error {
    return $FlutterErrorCopyWith<$Res>(_self.error, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

/// @nodoc

class DeviceErrorUnimplementedFailure implements DeviceError {
  const DeviceErrorUnimplementedFailure();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceErrorUnimplementedFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DeviceError.unimplemented()';
  }
}

/// @nodoc

class DeviceErrorForeachFailure implements DeviceError {
  const DeviceErrorForeachFailure(
      {required this.phase, required this.message, this.device});

  final String phase;
  final String message;
  final DeviceState? device;

  /// Create a copy of DeviceError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceErrorForeachFailureCopyWith<DeviceErrorForeachFailure> get copyWith =>
      _$DeviceErrorForeachFailureCopyWithImpl<DeviceErrorForeachFailure>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceErrorForeachFailure &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phase, message, device);

  @override
  String toString() {
    return 'DeviceError.foreachFailure(phase: $phase, message: $message, device: $device)';
  }
}

/// @nodoc
abstract mixin class $DeviceErrorForeachFailureCopyWith<$Res>
    implements $DeviceErrorCopyWith<$Res> {
  factory $DeviceErrorForeachFailureCopyWith(DeviceErrorForeachFailure value,
          $Res Function(DeviceErrorForeachFailure) _then) =
      _$DeviceErrorForeachFailureCopyWithImpl;
  @useResult
  $Res call({String phase, String message, DeviceState? device});

  $DeviceStateCopyWith<$Res>? get device;
}

/// @nodoc
class _$DeviceErrorForeachFailureCopyWithImpl<$Res>
    implements $DeviceErrorForeachFailureCopyWith<$Res> {
  _$DeviceErrorForeachFailureCopyWithImpl(this._self, this._then);

  final DeviceErrorForeachFailure _self;
  final $Res Function(DeviceErrorForeachFailure) _then;

  /// Create a copy of DeviceError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? phase = null,
    Object? message = null,
    Object? device = freezed,
  }) {
    return _then(DeviceErrorForeachFailure(
      phase: null == phase
          ? _self.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      device: freezed == device
          ? _self.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceState?,
    ));
  }

  /// Create a copy of DeviceError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceStateCopyWith<$Res>? get device {
    if (_self.device == null) {
      return null;
    }

    return $DeviceStateCopyWith<$Res>(_self.device!, (value) {
      return _then(_self.copyWith(device: value));
    });
  }
}

// dart format on
