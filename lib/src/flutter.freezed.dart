// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flutter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlutterError {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String message) toolchainFailure,
    required TResult Function(DeviceState state, String message) deviceFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String op, String message)? toolchainFailure,
    TResult Function(DeviceState state, String message)? deviceFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String message)? toolchainFailure,
    TResult Function(DeviceState state, String message)? deviceFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlutterErrorToolchainFailure value)
        toolchainFailure,
    required TResult Function(FlutterErrorDeviceFailure value) deviceFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FlutterErrorToolchainFailure value)? toolchainFailure,
    TResult Function(FlutterErrorDeviceFailure value)? deviceFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlutterErrorToolchainFailure value)? toolchainFailure,
    TResult Function(FlutterErrorDeviceFailure value)? deviceFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlutterErrorCopyWith<FlutterError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlutterErrorCopyWith<$Res> {
  factory $FlutterErrorCopyWith(
          FlutterError value, $Res Function(FlutterError) then) =
      _$FlutterErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$FlutterErrorCopyWithImpl<$Res> implements $FlutterErrorCopyWith<$Res> {
  _$FlutterErrorCopyWithImpl(this._value, this._then);

  final FlutterError _value;
  // ignore: unused_field
  final $Res Function(FlutterError) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$FlutterErrorToolchainFailureCopyWith<$Res>
    implements $FlutterErrorCopyWith<$Res> {
  factory _$$FlutterErrorToolchainFailureCopyWith(
          _$FlutterErrorToolchainFailure value,
          $Res Function(_$FlutterErrorToolchainFailure) then) =
      __$$FlutterErrorToolchainFailureCopyWithImpl<$Res>;
  @override
  $Res call({String op, String message});
}

/// @nodoc
class __$$FlutterErrorToolchainFailureCopyWithImpl<$Res>
    extends _$FlutterErrorCopyWithImpl<$Res>
    implements _$$FlutterErrorToolchainFailureCopyWith<$Res> {
  __$$FlutterErrorToolchainFailureCopyWithImpl(
      _$FlutterErrorToolchainFailure _value,
      $Res Function(_$FlutterErrorToolchainFailure) _then)
      : super(_value, (v) => _then(v as _$FlutterErrorToolchainFailure));

  @override
  _$FlutterErrorToolchainFailure get _value =>
      super._value as _$FlutterErrorToolchainFailure;

  @override
  $Res call({
    Object? op = freezed,
    Object? message = freezed,
  }) {
    return _then(_$FlutterErrorToolchainFailure(
      op: op == freezed
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FlutterErrorToolchainFailure implements FlutterErrorToolchainFailure {
  const _$FlutterErrorToolchainFailure(
      {required this.op, required this.message});

  @override
  final String op;
  @override
  final String message;

  @override
  String toString() {
    return 'FlutterError.toolchainFailure(op: $op, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlutterErrorToolchainFailure &&
            const DeepCollectionEquality().equals(other.op, op) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(op),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$FlutterErrorToolchainFailureCopyWith<_$FlutterErrorToolchainFailure>
      get copyWith => __$$FlutterErrorToolchainFailureCopyWithImpl<
          _$FlutterErrorToolchainFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String message) toolchainFailure,
    required TResult Function(DeviceState state, String message) deviceFailure,
  }) {
    return toolchainFailure(op, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String op, String message)? toolchainFailure,
    TResult Function(DeviceState state, String message)? deviceFailure,
  }) {
    return toolchainFailure?.call(op, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String message)? toolchainFailure,
    TResult Function(DeviceState state, String message)? deviceFailure,
    required TResult orElse(),
  }) {
    if (toolchainFailure != null) {
      return toolchainFailure(op, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlutterErrorToolchainFailure value)
        toolchainFailure,
    required TResult Function(FlutterErrorDeviceFailure value) deviceFailure,
  }) {
    return toolchainFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FlutterErrorToolchainFailure value)? toolchainFailure,
    TResult Function(FlutterErrorDeviceFailure value)? deviceFailure,
  }) {
    return toolchainFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlutterErrorToolchainFailure value)? toolchainFailure,
    TResult Function(FlutterErrorDeviceFailure value)? deviceFailure,
    required TResult orElse(),
  }) {
    if (toolchainFailure != null) {
      return toolchainFailure(this);
    }
    return orElse();
  }
}

abstract class FlutterErrorToolchainFailure implements FlutterError {
  const factory FlutterErrorToolchainFailure(
      {required final String op,
      required final String message}) = _$FlutterErrorToolchainFailure;

  String get op => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$FlutterErrorToolchainFailureCopyWith<_$FlutterErrorToolchainFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FlutterErrorDeviceFailureCopyWith<$Res>
    implements $FlutterErrorCopyWith<$Res> {
  factory _$$FlutterErrorDeviceFailureCopyWith(
          _$FlutterErrorDeviceFailure value,
          $Res Function(_$FlutterErrorDeviceFailure) then) =
      __$$FlutterErrorDeviceFailureCopyWithImpl<$Res>;
  @override
  $Res call({DeviceState state, String message});

  $DeviceStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$FlutterErrorDeviceFailureCopyWithImpl<$Res>
    extends _$FlutterErrorCopyWithImpl<$Res>
    implements _$$FlutterErrorDeviceFailureCopyWith<$Res> {
  __$$FlutterErrorDeviceFailureCopyWithImpl(_$FlutterErrorDeviceFailure _value,
      $Res Function(_$FlutterErrorDeviceFailure) _then)
      : super(_value, (v) => _then(v as _$FlutterErrorDeviceFailure));

  @override
  _$FlutterErrorDeviceFailure get _value =>
      super._value as _$FlutterErrorDeviceFailure;

  @override
  $Res call({
    Object? state = freezed,
    Object? message = freezed,
  }) {
    return _then(_$FlutterErrorDeviceFailure(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeviceState,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $DeviceStateCopyWith<$Res> get state {
    return $DeviceStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$FlutterErrorDeviceFailure implements FlutterErrorDeviceFailure {
  const _$FlutterErrorDeviceFailure(
      {required this.state, required this.message});

  @override
  final DeviceState state;
  @override
  final String message;

  @override
  String toString() {
    return 'FlutterError.deviceFailure(state: $state, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlutterErrorDeviceFailure &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$FlutterErrorDeviceFailureCopyWith<_$FlutterErrorDeviceFailure>
      get copyWith => __$$FlutterErrorDeviceFailureCopyWithImpl<
          _$FlutterErrorDeviceFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String message) toolchainFailure,
    required TResult Function(DeviceState state, String message) deviceFailure,
  }) {
    return deviceFailure(state, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String op, String message)? toolchainFailure,
    TResult Function(DeviceState state, String message)? deviceFailure,
  }) {
    return deviceFailure?.call(state, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String message)? toolchainFailure,
    TResult Function(DeviceState state, String message)? deviceFailure,
    required TResult orElse(),
  }) {
    if (deviceFailure != null) {
      return deviceFailure(state, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlutterErrorToolchainFailure value)
        toolchainFailure,
    required TResult Function(FlutterErrorDeviceFailure value) deviceFailure,
  }) {
    return deviceFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FlutterErrorToolchainFailure value)? toolchainFailure,
    TResult Function(FlutterErrorDeviceFailure value)? deviceFailure,
  }) {
    return deviceFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlutterErrorToolchainFailure value)? toolchainFailure,
    TResult Function(FlutterErrorDeviceFailure value)? deviceFailure,
    required TResult orElse(),
  }) {
    if (deviceFailure != null) {
      return deviceFailure(this);
    }
    return orElse();
  }
}

abstract class FlutterErrorDeviceFailure implements FlutterError {
  const factory FlutterErrorDeviceFailure(
      {required final DeviceState state,
      required final String message}) = _$FlutterErrorDeviceFailure;

  DeviceState get state => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$FlutterErrorDeviceFailureCopyWith<_$FlutterErrorDeviceFailure>
      get copyWith => throw _privateConstructorUsedError;
}
