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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FlutterErrorTearOff {
  const _$FlutterErrorTearOff();

  FlutterErrorToolchainFailure toolchainFailure(
      {required String op,
      required String message,
      required StackTrace stackTrace}) {
    return FlutterErrorToolchainFailure(
      op: op,
      message: message,
      stackTrace: stackTrace,
    );
  }
}

/// @nodoc
const $FlutterError = _$FlutterErrorTearOff();

/// @nodoc
mixin _$FlutterError {
  String get op => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String message, StackTrace stackTrace)
        toolchainFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String op, String message, StackTrace stackTrace)?
        toolchainFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String message, StackTrace stackTrace)?
        toolchainFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlutterErrorToolchainFailure value)
        toolchainFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FlutterErrorToolchainFailure value)? toolchainFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlutterErrorToolchainFailure value)? toolchainFailure,
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
  $Res call({String op, String message, StackTrace stackTrace});
}

/// @nodoc
class _$FlutterErrorCopyWithImpl<$Res> implements $FlutterErrorCopyWith<$Res> {
  _$FlutterErrorCopyWithImpl(this._value, this._then);

  final FlutterError _value;
  // ignore: unused_field
  final $Res Function(FlutterError) _then;

  @override
  $Res call({
    Object? op = freezed,
    Object? message = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      op: op == freezed
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc
abstract class $FlutterErrorToolchainFailureCopyWith<$Res>
    implements $FlutterErrorCopyWith<$Res> {
  factory $FlutterErrorToolchainFailureCopyWith(
          FlutterErrorToolchainFailure value,
          $Res Function(FlutterErrorToolchainFailure) then) =
      _$FlutterErrorToolchainFailureCopyWithImpl<$Res>;
  @override
  $Res call({String op, String message, StackTrace stackTrace});
}

/// @nodoc
class _$FlutterErrorToolchainFailureCopyWithImpl<$Res>
    extends _$FlutterErrorCopyWithImpl<$Res>
    implements $FlutterErrorToolchainFailureCopyWith<$Res> {
  _$FlutterErrorToolchainFailureCopyWithImpl(
      FlutterErrorToolchainFailure _value,
      $Res Function(FlutterErrorToolchainFailure) _then)
      : super(_value, (v) => _then(v as FlutterErrorToolchainFailure));

  @override
  FlutterErrorToolchainFailure get _value =>
      super._value as FlutterErrorToolchainFailure;

  @override
  $Res call({
    Object? op = freezed,
    Object? message = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(FlutterErrorToolchainFailure(
      op: op == freezed
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$FlutterErrorToolchainFailure implements FlutterErrorToolchainFailure {
  const _$FlutterErrorToolchainFailure(
      {required this.op, required this.message, required this.stackTrace});

  @override
  final String op;
  @override
  final String message;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'FlutterError.toolchainFailure(op: $op, message: $message, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlutterErrorToolchainFailure &&
            const DeepCollectionEquality().equals(other.op, op) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(op),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  $FlutterErrorToolchainFailureCopyWith<FlutterErrorToolchainFailure>
      get copyWith => _$FlutterErrorToolchainFailureCopyWithImpl<
          FlutterErrorToolchainFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String message, StackTrace stackTrace)
        toolchainFailure,
  }) {
    return toolchainFailure(op, message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String op, String message, StackTrace stackTrace)?
        toolchainFailure,
  }) {
    return toolchainFailure?.call(op, message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String message, StackTrace stackTrace)?
        toolchainFailure,
    required TResult orElse(),
  }) {
    if (toolchainFailure != null) {
      return toolchainFailure(op, message, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlutterErrorToolchainFailure value)
        toolchainFailure,
  }) {
    return toolchainFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FlutterErrorToolchainFailure value)? toolchainFailure,
  }) {
    return toolchainFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlutterErrorToolchainFailure value)? toolchainFailure,
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
      {required String op,
      required String message,
      required StackTrace stackTrace}) = _$FlutterErrorToolchainFailure;

  @override
  String get op;
  @override
  String get message;
  @override
  StackTrace get stackTrace;
  @override
  @JsonKey(ignore: true)
  $FlutterErrorToolchainFailureCopyWith<FlutterErrorToolchainFailure>
      get copyWith => throw _privateConstructorUsedError;
}
