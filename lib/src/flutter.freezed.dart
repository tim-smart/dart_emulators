// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flutter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlutterError {
  String get message;

  /// Create a copy of FlutterError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlutterErrorCopyWith<FlutterError> get copyWith =>
      _$FlutterErrorCopyWithImpl<FlutterError>(
          this as FlutterError, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlutterError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'FlutterError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FlutterErrorCopyWith<$Res> {
  factory $FlutterErrorCopyWith(
          FlutterError value, $Res Function(FlutterError) _then) =
      _$FlutterErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FlutterErrorCopyWithImpl<$Res> implements $FlutterErrorCopyWith<$Res> {
  _$FlutterErrorCopyWithImpl(this._self, this._then);

  final FlutterError _self;
  final $Res Function(FlutterError) _then;

  /// Create a copy of FlutterError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class FlutterErrorToolchainFailure implements FlutterError {
  const FlutterErrorToolchainFailure({required this.op, required this.message});

  final String op;
  @override
  final String message;

  /// Create a copy of FlutterError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlutterErrorToolchainFailureCopyWith<FlutterErrorToolchainFailure>
      get copyWith => _$FlutterErrorToolchainFailureCopyWithImpl<
          FlutterErrorToolchainFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlutterErrorToolchainFailure &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, op, message);

  @override
  String toString() {
    return 'FlutterError.toolchainFailure(op: $op, message: $message)';
  }
}

/// @nodoc
abstract mixin class $FlutterErrorToolchainFailureCopyWith<$Res>
    implements $FlutterErrorCopyWith<$Res> {
  factory $FlutterErrorToolchainFailureCopyWith(
          FlutterErrorToolchainFailure value,
          $Res Function(FlutterErrorToolchainFailure) _then) =
      _$FlutterErrorToolchainFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String op, String message});
}

/// @nodoc
class _$FlutterErrorToolchainFailureCopyWithImpl<$Res>
    implements $FlutterErrorToolchainFailureCopyWith<$Res> {
  _$FlutterErrorToolchainFailureCopyWithImpl(this._self, this._then);

  final FlutterErrorToolchainFailure _self;
  final $Res Function(FlutterErrorToolchainFailure) _then;

  /// Create a copy of FlutterError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? op = null,
    Object? message = null,
  }) {
    return _then(FlutterErrorToolchainFailure(
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

class FlutterErrorDeviceFailure implements FlutterError {
  const FlutterErrorDeviceFailure({required this.state, required this.message});

  final DeviceState state;
  @override
  final String message;

  /// Create a copy of FlutterError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlutterErrorDeviceFailureCopyWith<FlutterErrorDeviceFailure> get copyWith =>
      _$FlutterErrorDeviceFailureCopyWithImpl<FlutterErrorDeviceFailure>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlutterErrorDeviceFailure &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message);

  @override
  String toString() {
    return 'FlutterError.deviceFailure(state: $state, message: $message)';
  }
}

/// @nodoc
abstract mixin class $FlutterErrorDeviceFailureCopyWith<$Res>
    implements $FlutterErrorCopyWith<$Res> {
  factory $FlutterErrorDeviceFailureCopyWith(FlutterErrorDeviceFailure value,
          $Res Function(FlutterErrorDeviceFailure) _then) =
      _$FlutterErrorDeviceFailureCopyWithImpl;
  @override
  @useResult
  $Res call({DeviceState state, String message});

  $DeviceStateCopyWith<$Res> get state;
}

/// @nodoc
class _$FlutterErrorDeviceFailureCopyWithImpl<$Res>
    implements $FlutterErrorDeviceFailureCopyWith<$Res> {
  _$FlutterErrorDeviceFailureCopyWithImpl(this._self, this._then);

  final FlutterErrorDeviceFailure _self;
  final $Res Function(FlutterErrorDeviceFailure) _then;

  /// Create a copy of FlutterError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? state = null,
    Object? message = null,
  }) {
    return _then(FlutterErrorDeviceFailure(
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeviceState,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of FlutterError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceStateCopyWith<$Res> get state {
    return $DeviceStateCopyWith<$Res>(_self.state, (value) {
      return _then(_self.copyWith(state: value));
    });
  }
}

// dart format on
