// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String command, String message)
        toolchainFailure,
    required TResult Function(String op, String message) processKillFailure,
    required TResult Function(String op, FlutterError error) flutterFailure,
    required TResult Function() unimplemented,
    required TResult Function(String phase, String message, DeviceState? device)
        foreachFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String op, String command, String message)?
        toolchainFailure,
    TResult? Function(String op, String message)? processKillFailure,
    TResult? Function(String op, FlutterError error)? flutterFailure,
    TResult? Function()? unimplemented,
    TResult? Function(String phase, String message, DeviceState? device)?
        foreachFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, FlutterError error)? flutterFailure,
    TResult Function()? unimplemented,
    TResult Function(String phase, String message, DeviceState? device)?
        foreachFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceErrorToolchainFailure value)
        toolchainFailure,
    required TResult Function(DeviceErrorProcessKillFailure value)
        processKillFailure,
    required TResult Function(DeviceErrorFlutterFailure value) flutterFailure,
    required TResult Function(DeviceErrorUnimplementedFailure value)
        unimplemented,
    required TResult Function(DeviceErrorForeachFailure value) foreachFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult? Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult? Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult? Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult? Function(DeviceErrorForeachFailure value)? foreachFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult Function(DeviceErrorForeachFailure value)? foreachFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceErrorCopyWith<$Res> {
  factory $DeviceErrorCopyWith(
          DeviceError value, $Res Function(DeviceError) then) =
      _$DeviceErrorCopyWithImpl<$Res, DeviceError>;
}

/// @nodoc
class _$DeviceErrorCopyWithImpl<$Res, $Val extends DeviceError>
    implements $DeviceErrorCopyWith<$Res> {
  _$DeviceErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DeviceErrorToolchainFailureCopyWith<$Res> {
  factory _$$DeviceErrorToolchainFailureCopyWith(
          _$DeviceErrorToolchainFailure value,
          $Res Function(_$DeviceErrorToolchainFailure) then) =
      __$$DeviceErrorToolchainFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String op, String command, String message});
}

/// @nodoc
class __$$DeviceErrorToolchainFailureCopyWithImpl<$Res>
    extends _$DeviceErrorCopyWithImpl<$Res, _$DeviceErrorToolchainFailure>
    implements _$$DeviceErrorToolchainFailureCopyWith<$Res> {
  __$$DeviceErrorToolchainFailureCopyWithImpl(
      _$DeviceErrorToolchainFailure _value,
      $Res Function(_$DeviceErrorToolchainFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? op = null,
    Object? command = null,
    Object? message = null,
  }) {
    return _then(_$DeviceErrorToolchainFailure(
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      command: null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeviceErrorToolchainFailure implements DeviceErrorToolchainFailure {
  const _$DeviceErrorToolchainFailure(
      {required this.op, required this.command, required this.message});

  @override
  final String op;
  @override
  final String command;
  @override
  final String message;

  @override
  String toString() {
    return 'DeviceError.toolchainFailure(op: $op, command: $command, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceErrorToolchainFailure &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.command, command) || other.command == command) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, op, command, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceErrorToolchainFailureCopyWith<_$DeviceErrorToolchainFailure>
      get copyWith => __$$DeviceErrorToolchainFailureCopyWithImpl<
          _$DeviceErrorToolchainFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String command, String message)
        toolchainFailure,
    required TResult Function(String op, String message) processKillFailure,
    required TResult Function(String op, FlutterError error) flutterFailure,
    required TResult Function() unimplemented,
    required TResult Function(String phase, String message, DeviceState? device)
        foreachFailure,
  }) {
    return toolchainFailure(op, command, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String op, String command, String message)?
        toolchainFailure,
    TResult? Function(String op, String message)? processKillFailure,
    TResult? Function(String op, FlutterError error)? flutterFailure,
    TResult? Function()? unimplemented,
    TResult? Function(String phase, String message, DeviceState? device)?
        foreachFailure,
  }) {
    return toolchainFailure?.call(op, command, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, FlutterError error)? flutterFailure,
    TResult Function()? unimplemented,
    TResult Function(String phase, String message, DeviceState? device)?
        foreachFailure,
    required TResult orElse(),
  }) {
    if (toolchainFailure != null) {
      return toolchainFailure(op, command, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceErrorToolchainFailure value)
        toolchainFailure,
    required TResult Function(DeviceErrorProcessKillFailure value)
        processKillFailure,
    required TResult Function(DeviceErrorFlutterFailure value) flutterFailure,
    required TResult Function(DeviceErrorUnimplementedFailure value)
        unimplemented,
    required TResult Function(DeviceErrorForeachFailure value) foreachFailure,
  }) {
    return toolchainFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult? Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult? Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult? Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult? Function(DeviceErrorForeachFailure value)? foreachFailure,
  }) {
    return toolchainFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult Function(DeviceErrorForeachFailure value)? foreachFailure,
    required TResult orElse(),
  }) {
    if (toolchainFailure != null) {
      return toolchainFailure(this);
    }
    return orElse();
  }
}

abstract class DeviceErrorToolchainFailure implements DeviceError {
  const factory DeviceErrorToolchainFailure(
      {required final String op,
      required final String command,
      required final String message}) = _$DeviceErrorToolchainFailure;

  String get op;
  String get command;
  String get message;
  @JsonKey(ignore: true)
  _$$DeviceErrorToolchainFailureCopyWith<_$DeviceErrorToolchainFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceErrorProcessKillFailureCopyWith<$Res> {
  factory _$$DeviceErrorProcessKillFailureCopyWith(
          _$DeviceErrorProcessKillFailure value,
          $Res Function(_$DeviceErrorProcessKillFailure) then) =
      __$$DeviceErrorProcessKillFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String op, String message});
}

/// @nodoc
class __$$DeviceErrorProcessKillFailureCopyWithImpl<$Res>
    extends _$DeviceErrorCopyWithImpl<$Res, _$DeviceErrorProcessKillFailure>
    implements _$$DeviceErrorProcessKillFailureCopyWith<$Res> {
  __$$DeviceErrorProcessKillFailureCopyWithImpl(
      _$DeviceErrorProcessKillFailure _value,
      $Res Function(_$DeviceErrorProcessKillFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? op = null,
    Object? message = null,
  }) {
    return _then(_$DeviceErrorProcessKillFailure(
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeviceErrorProcessKillFailure implements DeviceErrorProcessKillFailure {
  const _$DeviceErrorProcessKillFailure(
      {required this.op, required this.message});

  @override
  final String op;
  @override
  final String message;

  @override
  String toString() {
    return 'DeviceError.processKillFailure(op: $op, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceErrorProcessKillFailure &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, op, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceErrorProcessKillFailureCopyWith<_$DeviceErrorProcessKillFailure>
      get copyWith => __$$DeviceErrorProcessKillFailureCopyWithImpl<
          _$DeviceErrorProcessKillFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String command, String message)
        toolchainFailure,
    required TResult Function(String op, String message) processKillFailure,
    required TResult Function(String op, FlutterError error) flutterFailure,
    required TResult Function() unimplemented,
    required TResult Function(String phase, String message, DeviceState? device)
        foreachFailure,
  }) {
    return processKillFailure(op, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String op, String command, String message)?
        toolchainFailure,
    TResult? Function(String op, String message)? processKillFailure,
    TResult? Function(String op, FlutterError error)? flutterFailure,
    TResult? Function()? unimplemented,
    TResult? Function(String phase, String message, DeviceState? device)?
        foreachFailure,
  }) {
    return processKillFailure?.call(op, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, FlutterError error)? flutterFailure,
    TResult Function()? unimplemented,
    TResult Function(String phase, String message, DeviceState? device)?
        foreachFailure,
    required TResult orElse(),
  }) {
    if (processKillFailure != null) {
      return processKillFailure(op, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceErrorToolchainFailure value)
        toolchainFailure,
    required TResult Function(DeviceErrorProcessKillFailure value)
        processKillFailure,
    required TResult Function(DeviceErrorFlutterFailure value) flutterFailure,
    required TResult Function(DeviceErrorUnimplementedFailure value)
        unimplemented,
    required TResult Function(DeviceErrorForeachFailure value) foreachFailure,
  }) {
    return processKillFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult? Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult? Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult? Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult? Function(DeviceErrorForeachFailure value)? foreachFailure,
  }) {
    return processKillFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult Function(DeviceErrorForeachFailure value)? foreachFailure,
    required TResult orElse(),
  }) {
    if (processKillFailure != null) {
      return processKillFailure(this);
    }
    return orElse();
  }
}

abstract class DeviceErrorProcessKillFailure implements DeviceError {
  const factory DeviceErrorProcessKillFailure(
      {required final String op,
      required final String message}) = _$DeviceErrorProcessKillFailure;

  String get op;
  String get message;
  @JsonKey(ignore: true)
  _$$DeviceErrorProcessKillFailureCopyWith<_$DeviceErrorProcessKillFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceErrorFlutterFailureCopyWith<$Res> {
  factory _$$DeviceErrorFlutterFailureCopyWith(
          _$DeviceErrorFlutterFailure value,
          $Res Function(_$DeviceErrorFlutterFailure) then) =
      __$$DeviceErrorFlutterFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String op, FlutterError error});

  $FlutterErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$DeviceErrorFlutterFailureCopyWithImpl<$Res>
    extends _$DeviceErrorCopyWithImpl<$Res, _$DeviceErrorFlutterFailure>
    implements _$$DeviceErrorFlutterFailureCopyWith<$Res> {
  __$$DeviceErrorFlutterFailureCopyWithImpl(_$DeviceErrorFlutterFailure _value,
      $Res Function(_$DeviceErrorFlutterFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? op = null,
    Object? error = null,
  }) {
    return _then(_$DeviceErrorFlutterFailure(
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as FlutterError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FlutterErrorCopyWith<$Res> get error {
    return $FlutterErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$DeviceErrorFlutterFailure implements DeviceErrorFlutterFailure {
  const _$DeviceErrorFlutterFailure({required this.op, required this.error});

  @override
  final String op;
  @override
  final FlutterError error;

  @override
  String toString() {
    return 'DeviceError.flutterFailure(op: $op, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceErrorFlutterFailure &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, op, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceErrorFlutterFailureCopyWith<_$DeviceErrorFlutterFailure>
      get copyWith => __$$DeviceErrorFlutterFailureCopyWithImpl<
          _$DeviceErrorFlutterFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String command, String message)
        toolchainFailure,
    required TResult Function(String op, String message) processKillFailure,
    required TResult Function(String op, FlutterError error) flutterFailure,
    required TResult Function() unimplemented,
    required TResult Function(String phase, String message, DeviceState? device)
        foreachFailure,
  }) {
    return flutterFailure(op, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String op, String command, String message)?
        toolchainFailure,
    TResult? Function(String op, String message)? processKillFailure,
    TResult? Function(String op, FlutterError error)? flutterFailure,
    TResult? Function()? unimplemented,
    TResult? Function(String phase, String message, DeviceState? device)?
        foreachFailure,
  }) {
    return flutterFailure?.call(op, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, FlutterError error)? flutterFailure,
    TResult Function()? unimplemented,
    TResult Function(String phase, String message, DeviceState? device)?
        foreachFailure,
    required TResult orElse(),
  }) {
    if (flutterFailure != null) {
      return flutterFailure(op, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceErrorToolchainFailure value)
        toolchainFailure,
    required TResult Function(DeviceErrorProcessKillFailure value)
        processKillFailure,
    required TResult Function(DeviceErrorFlutterFailure value) flutterFailure,
    required TResult Function(DeviceErrorUnimplementedFailure value)
        unimplemented,
    required TResult Function(DeviceErrorForeachFailure value) foreachFailure,
  }) {
    return flutterFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult? Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult? Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult? Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult? Function(DeviceErrorForeachFailure value)? foreachFailure,
  }) {
    return flutterFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult Function(DeviceErrorForeachFailure value)? foreachFailure,
    required TResult orElse(),
  }) {
    if (flutterFailure != null) {
      return flutterFailure(this);
    }
    return orElse();
  }
}

abstract class DeviceErrorFlutterFailure implements DeviceError {
  const factory DeviceErrorFlutterFailure(
      {required final String op,
      required final FlutterError error}) = _$DeviceErrorFlutterFailure;

  String get op;
  FlutterError get error;
  @JsonKey(ignore: true)
  _$$DeviceErrorFlutterFailureCopyWith<_$DeviceErrorFlutterFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceErrorUnimplementedFailureCopyWith<$Res> {
  factory _$$DeviceErrorUnimplementedFailureCopyWith(
          _$DeviceErrorUnimplementedFailure value,
          $Res Function(_$DeviceErrorUnimplementedFailure) then) =
      __$$DeviceErrorUnimplementedFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceErrorUnimplementedFailureCopyWithImpl<$Res>
    extends _$DeviceErrorCopyWithImpl<$Res, _$DeviceErrorUnimplementedFailure>
    implements _$$DeviceErrorUnimplementedFailureCopyWith<$Res> {
  __$$DeviceErrorUnimplementedFailureCopyWithImpl(
      _$DeviceErrorUnimplementedFailure _value,
      $Res Function(_$DeviceErrorUnimplementedFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeviceErrorUnimplementedFailure
    implements DeviceErrorUnimplementedFailure {
  const _$DeviceErrorUnimplementedFailure();

  @override
  String toString() {
    return 'DeviceError.unimplemented()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceErrorUnimplementedFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String command, String message)
        toolchainFailure,
    required TResult Function(String op, String message) processKillFailure,
    required TResult Function(String op, FlutterError error) flutterFailure,
    required TResult Function() unimplemented,
    required TResult Function(String phase, String message, DeviceState? device)
        foreachFailure,
  }) {
    return unimplemented();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String op, String command, String message)?
        toolchainFailure,
    TResult? Function(String op, String message)? processKillFailure,
    TResult? Function(String op, FlutterError error)? flutterFailure,
    TResult? Function()? unimplemented,
    TResult? Function(String phase, String message, DeviceState? device)?
        foreachFailure,
  }) {
    return unimplemented?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, FlutterError error)? flutterFailure,
    TResult Function()? unimplemented,
    TResult Function(String phase, String message, DeviceState? device)?
        foreachFailure,
    required TResult orElse(),
  }) {
    if (unimplemented != null) {
      return unimplemented();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceErrorToolchainFailure value)
        toolchainFailure,
    required TResult Function(DeviceErrorProcessKillFailure value)
        processKillFailure,
    required TResult Function(DeviceErrorFlutterFailure value) flutterFailure,
    required TResult Function(DeviceErrorUnimplementedFailure value)
        unimplemented,
    required TResult Function(DeviceErrorForeachFailure value) foreachFailure,
  }) {
    return unimplemented(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult? Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult? Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult? Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult? Function(DeviceErrorForeachFailure value)? foreachFailure,
  }) {
    return unimplemented?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult Function(DeviceErrorForeachFailure value)? foreachFailure,
    required TResult orElse(),
  }) {
    if (unimplemented != null) {
      return unimplemented(this);
    }
    return orElse();
  }
}

abstract class DeviceErrorUnimplementedFailure implements DeviceError {
  const factory DeviceErrorUnimplementedFailure() =
      _$DeviceErrorUnimplementedFailure;
}

/// @nodoc
abstract class _$$DeviceErrorForeachFailureCopyWith<$Res> {
  factory _$$DeviceErrorForeachFailureCopyWith(
          _$DeviceErrorForeachFailure value,
          $Res Function(_$DeviceErrorForeachFailure) then) =
      __$$DeviceErrorForeachFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String phase, String message, DeviceState? device});

  $DeviceStateCopyWith<$Res>? get device;
}

/// @nodoc
class __$$DeviceErrorForeachFailureCopyWithImpl<$Res>
    extends _$DeviceErrorCopyWithImpl<$Res, _$DeviceErrorForeachFailure>
    implements _$$DeviceErrorForeachFailureCopyWith<$Res> {
  __$$DeviceErrorForeachFailureCopyWithImpl(_$DeviceErrorForeachFailure _value,
      $Res Function(_$DeviceErrorForeachFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? message = null,
    Object? device = freezed,
  }) {
    return _then(_$DeviceErrorForeachFailure(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceState?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceStateCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $DeviceStateCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$DeviceErrorForeachFailure implements DeviceErrorForeachFailure {
  const _$DeviceErrorForeachFailure(
      {required this.phase, required this.message, this.device});

  @override
  final String phase;
  @override
  final String message;
  @override
  final DeviceState? device;

  @override
  String toString() {
    return 'DeviceError.foreachFailure(phase: $phase, message: $message, device: $device)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceErrorForeachFailure &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phase, message, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceErrorForeachFailureCopyWith<_$DeviceErrorForeachFailure>
      get copyWith => __$$DeviceErrorForeachFailureCopyWithImpl<
          _$DeviceErrorForeachFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String command, String message)
        toolchainFailure,
    required TResult Function(String op, String message) processKillFailure,
    required TResult Function(String op, FlutterError error) flutterFailure,
    required TResult Function() unimplemented,
    required TResult Function(String phase, String message, DeviceState? device)
        foreachFailure,
  }) {
    return foreachFailure(phase, message, device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String op, String command, String message)?
        toolchainFailure,
    TResult? Function(String op, String message)? processKillFailure,
    TResult? Function(String op, FlutterError error)? flutterFailure,
    TResult? Function()? unimplemented,
    TResult? Function(String phase, String message, DeviceState? device)?
        foreachFailure,
  }) {
    return foreachFailure?.call(phase, message, device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, FlutterError error)? flutterFailure,
    TResult Function()? unimplemented,
    TResult Function(String phase, String message, DeviceState? device)?
        foreachFailure,
    required TResult orElse(),
  }) {
    if (foreachFailure != null) {
      return foreachFailure(phase, message, device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceErrorToolchainFailure value)
        toolchainFailure,
    required TResult Function(DeviceErrorProcessKillFailure value)
        processKillFailure,
    required TResult Function(DeviceErrorFlutterFailure value) flutterFailure,
    required TResult Function(DeviceErrorUnimplementedFailure value)
        unimplemented,
    required TResult Function(DeviceErrorForeachFailure value) foreachFailure,
  }) {
    return foreachFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult? Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult? Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult? Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult? Function(DeviceErrorForeachFailure value)? foreachFailure,
  }) {
    return foreachFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
    TResult Function(DeviceErrorUnimplementedFailure value)? unimplemented,
    TResult Function(DeviceErrorForeachFailure value)? foreachFailure,
    required TResult orElse(),
  }) {
    if (foreachFailure != null) {
      return foreachFailure(this);
    }
    return orElse();
  }
}

abstract class DeviceErrorForeachFailure implements DeviceError {
  const factory DeviceErrorForeachFailure(
      {required final String phase,
      required final String message,
      final DeviceState? device}) = _$DeviceErrorForeachFailure;

  String get phase;
  String get message;
  DeviceState? get device;
  @JsonKey(ignore: true)
  _$$DeviceErrorForeachFailureCopyWith<_$DeviceErrorForeachFailure>
      get copyWith => throw _privateConstructorUsedError;
}
