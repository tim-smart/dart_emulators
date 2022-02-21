// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeviceErrorTearOff {
  const _$DeviceErrorTearOff();

  DeviceErrorToolchainFailure toolchainFailure(
      {required String op, required String command, required String message}) {
    return DeviceErrorToolchainFailure(
      op: op,
      command: command,
      message: message,
    );
  }

  DeviceErrorProcessKillFailure processKillFailure(
      {required String op, required String message}) {
    return DeviceErrorProcessKillFailure(
      op: op,
      message: message,
    );
  }

  DeviceErrorFlutterFailure flutterFailure(
      {required String op, required String command, required String message}) {
    return DeviceErrorFlutterFailure(
      op: op,
      command: command,
      message: message,
    );
  }
}

/// @nodoc
const $DeviceError = _$DeviceErrorTearOff();

/// @nodoc
mixin _$DeviceError {
  String get op => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String command, String message)
        toolchainFailure,
    required TResult Function(String op, String message) processKillFailure,
    required TResult Function(String op, String command, String message)
        flutterFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, String command, String message)? flutterFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, String command, String message)? flutterFailure,
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceErrorCopyWith<DeviceError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceErrorCopyWith<$Res> {
  factory $DeviceErrorCopyWith(
          DeviceError value, $Res Function(DeviceError) then) =
      _$DeviceErrorCopyWithImpl<$Res>;
  $Res call({String op, String message});
}

/// @nodoc
class _$DeviceErrorCopyWithImpl<$Res> implements $DeviceErrorCopyWith<$Res> {
  _$DeviceErrorCopyWithImpl(this._value, this._then);

  final DeviceError _value;
  // ignore: unused_field
  final $Res Function(DeviceError) _then;

  @override
  $Res call({
    Object? op = freezed,
    Object? message = freezed,
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
    ));
  }
}

/// @nodoc
abstract class $DeviceErrorToolchainFailureCopyWith<$Res>
    implements $DeviceErrorCopyWith<$Res> {
  factory $DeviceErrorToolchainFailureCopyWith(
          DeviceErrorToolchainFailure value,
          $Res Function(DeviceErrorToolchainFailure) then) =
      _$DeviceErrorToolchainFailureCopyWithImpl<$Res>;
  @override
  $Res call({String op, String command, String message});
}

/// @nodoc
class _$DeviceErrorToolchainFailureCopyWithImpl<$Res>
    extends _$DeviceErrorCopyWithImpl<$Res>
    implements $DeviceErrorToolchainFailureCopyWith<$Res> {
  _$DeviceErrorToolchainFailureCopyWithImpl(DeviceErrorToolchainFailure _value,
      $Res Function(DeviceErrorToolchainFailure) _then)
      : super(_value, (v) => _then(v as DeviceErrorToolchainFailure));

  @override
  DeviceErrorToolchainFailure get _value =>
      super._value as DeviceErrorToolchainFailure;

  @override
  $Res call({
    Object? op = freezed,
    Object? command = freezed,
    Object? message = freezed,
  }) {
    return _then(DeviceErrorToolchainFailure(
      op: op == freezed
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      command: command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
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
            other is DeviceErrorToolchainFailure &&
            const DeepCollectionEquality().equals(other.op, op) &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(op),
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $DeviceErrorToolchainFailureCopyWith<DeviceErrorToolchainFailure>
      get copyWith => _$DeviceErrorToolchainFailureCopyWithImpl<
          DeviceErrorToolchainFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String command, String message)
        toolchainFailure,
    required TResult Function(String op, String message) processKillFailure,
    required TResult Function(String op, String command, String message)
        flutterFailure,
  }) {
    return toolchainFailure(op, command, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, String command, String message)? flutterFailure,
  }) {
    return toolchainFailure?.call(op, command, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, String command, String message)? flutterFailure,
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
  }) {
    return toolchainFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
  }) {
    return toolchainFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
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
      {required String op,
      required String command,
      required String message}) = _$DeviceErrorToolchainFailure;

  @override
  String get op;
  String get command;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  $DeviceErrorToolchainFailureCopyWith<DeviceErrorToolchainFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceErrorProcessKillFailureCopyWith<$Res>
    implements $DeviceErrorCopyWith<$Res> {
  factory $DeviceErrorProcessKillFailureCopyWith(
          DeviceErrorProcessKillFailure value,
          $Res Function(DeviceErrorProcessKillFailure) then) =
      _$DeviceErrorProcessKillFailureCopyWithImpl<$Res>;
  @override
  $Res call({String op, String message});
}

/// @nodoc
class _$DeviceErrorProcessKillFailureCopyWithImpl<$Res>
    extends _$DeviceErrorCopyWithImpl<$Res>
    implements $DeviceErrorProcessKillFailureCopyWith<$Res> {
  _$DeviceErrorProcessKillFailureCopyWithImpl(
      DeviceErrorProcessKillFailure _value,
      $Res Function(DeviceErrorProcessKillFailure) _then)
      : super(_value, (v) => _then(v as DeviceErrorProcessKillFailure));

  @override
  DeviceErrorProcessKillFailure get _value =>
      super._value as DeviceErrorProcessKillFailure;

  @override
  $Res call({
    Object? op = freezed,
    Object? message = freezed,
  }) {
    return _then(DeviceErrorProcessKillFailure(
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
            other is DeviceErrorProcessKillFailure &&
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
  $DeviceErrorProcessKillFailureCopyWith<DeviceErrorProcessKillFailure>
      get copyWith => _$DeviceErrorProcessKillFailureCopyWithImpl<
          DeviceErrorProcessKillFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String command, String message)
        toolchainFailure,
    required TResult Function(String op, String message) processKillFailure,
    required TResult Function(String op, String command, String message)
        flutterFailure,
  }) {
    return processKillFailure(op, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, String command, String message)? flutterFailure,
  }) {
    return processKillFailure?.call(op, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, String command, String message)? flutterFailure,
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
  }) {
    return processKillFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
  }) {
    return processKillFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
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
      {required String op,
      required String message}) = _$DeviceErrorProcessKillFailure;

  @override
  String get op;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  $DeviceErrorProcessKillFailureCopyWith<DeviceErrorProcessKillFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceErrorFlutterFailureCopyWith<$Res>
    implements $DeviceErrorCopyWith<$Res> {
  factory $DeviceErrorFlutterFailureCopyWith(DeviceErrorFlutterFailure value,
          $Res Function(DeviceErrorFlutterFailure) then) =
      _$DeviceErrorFlutterFailureCopyWithImpl<$Res>;
  @override
  $Res call({String op, String command, String message});
}

/// @nodoc
class _$DeviceErrorFlutterFailureCopyWithImpl<$Res>
    extends _$DeviceErrorCopyWithImpl<$Res>
    implements $DeviceErrorFlutterFailureCopyWith<$Res> {
  _$DeviceErrorFlutterFailureCopyWithImpl(DeviceErrorFlutterFailure _value,
      $Res Function(DeviceErrorFlutterFailure) _then)
      : super(_value, (v) => _then(v as DeviceErrorFlutterFailure));

  @override
  DeviceErrorFlutterFailure get _value =>
      super._value as DeviceErrorFlutterFailure;

  @override
  $Res call({
    Object? op = freezed,
    Object? command = freezed,
    Object? message = freezed,
  }) {
    return _then(DeviceErrorFlutterFailure(
      op: op == freezed
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as String,
      command: command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeviceErrorFlutterFailure implements DeviceErrorFlutterFailure {
  const _$DeviceErrorFlutterFailure(
      {required this.op, required this.command, required this.message});

  @override
  final String op;
  @override
  final String command;
  @override
  final String message;

  @override
  String toString() {
    return 'DeviceError.flutterFailure(op: $op, command: $command, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceErrorFlutterFailure &&
            const DeepCollectionEquality().equals(other.op, op) &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(op),
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $DeviceErrorFlutterFailureCopyWith<DeviceErrorFlutterFailure> get copyWith =>
      _$DeviceErrorFlutterFailureCopyWithImpl<DeviceErrorFlutterFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String op, String command, String message)
        toolchainFailure,
    required TResult Function(String op, String message) processKillFailure,
    required TResult Function(String op, String command, String message)
        flutterFailure,
  }) {
    return flutterFailure(op, command, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, String command, String message)? flutterFailure,
  }) {
    return flutterFailure?.call(op, command, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String op, String command, String message)?
        toolchainFailure,
    TResult Function(String op, String message)? processKillFailure,
    TResult Function(String op, String command, String message)? flutterFailure,
    required TResult orElse(),
  }) {
    if (flutterFailure != null) {
      return flutterFailure(op, command, message);
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
  }) {
    return flutterFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
  }) {
    return flutterFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceErrorToolchainFailure value)? toolchainFailure,
    TResult Function(DeviceErrorProcessKillFailure value)? processKillFailure,
    TResult Function(DeviceErrorFlutterFailure value)? flutterFailure,
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
      {required String op,
      required String command,
      required String message}) = _$DeviceErrorFlutterFailure;

  @override
  String get op;
  String get command;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  $DeviceErrorFlutterFailureCopyWith<DeviceErrorFlutterFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
