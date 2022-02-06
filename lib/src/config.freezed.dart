// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConfigTearOff {
  const _$ConfigTearOff();

  _Config call(
      {required String adbPath,
      required String avdmanagerPath,
      required String emulatorPath,
      required String flutterPath,
      required String xcrunPath,
      required bool verbose}) {
    return _Config(
      adbPath: adbPath,
      avdmanagerPath: avdmanagerPath,
      emulatorPath: emulatorPath,
      flutterPath: flutterPath,
      xcrunPath: xcrunPath,
      verbose: verbose,
    );
  }
}

/// @nodoc
const $Config = _$ConfigTearOff();

/// @nodoc
mixin _$Config {
  String get adbPath => throw _privateConstructorUsedError;
  String get avdmanagerPath => throw _privateConstructorUsedError;
  String get emulatorPath => throw _privateConstructorUsedError;
  String get flutterPath => throw _privateConstructorUsedError;
  String get xcrunPath => throw _privateConstructorUsedError;
  bool get verbose => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res>;
  $Res call(
      {String adbPath,
      String avdmanagerPath,
      String emulatorPath,
      String flutterPath,
      String xcrunPath,
      bool verbose});
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res> implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  final Config _value;
  // ignore: unused_field
  final $Res Function(Config) _then;

  @override
  $Res call({
    Object? adbPath = freezed,
    Object? avdmanagerPath = freezed,
    Object? emulatorPath = freezed,
    Object? flutterPath = freezed,
    Object? xcrunPath = freezed,
    Object? verbose = freezed,
  }) {
    return _then(_value.copyWith(
      adbPath: adbPath == freezed
          ? _value.adbPath
          : adbPath // ignore: cast_nullable_to_non_nullable
              as String,
      avdmanagerPath: avdmanagerPath == freezed
          ? _value.avdmanagerPath
          : avdmanagerPath // ignore: cast_nullable_to_non_nullable
              as String,
      emulatorPath: emulatorPath == freezed
          ? _value.emulatorPath
          : emulatorPath // ignore: cast_nullable_to_non_nullable
              as String,
      flutterPath: flutterPath == freezed
          ? _value.flutterPath
          : flutterPath // ignore: cast_nullable_to_non_nullable
              as String,
      xcrunPath: xcrunPath == freezed
          ? _value.xcrunPath
          : xcrunPath // ignore: cast_nullable_to_non_nullable
              as String,
      verbose: verbose == freezed
          ? _value.verbose
          : verbose // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$ConfigCopyWith(_Config value, $Res Function(_Config) then) =
      __$ConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {String adbPath,
      String avdmanagerPath,
      String emulatorPath,
      String flutterPath,
      String xcrunPath,
      bool verbose});
}

/// @nodoc
class __$ConfigCopyWithImpl<$Res> extends _$ConfigCopyWithImpl<$Res>
    implements _$ConfigCopyWith<$Res> {
  __$ConfigCopyWithImpl(_Config _value, $Res Function(_Config) _then)
      : super(_value, (v) => _then(v as _Config));

  @override
  _Config get _value => super._value as _Config;

  @override
  $Res call({
    Object? adbPath = freezed,
    Object? avdmanagerPath = freezed,
    Object? emulatorPath = freezed,
    Object? flutterPath = freezed,
    Object? xcrunPath = freezed,
    Object? verbose = freezed,
  }) {
    return _then(_Config(
      adbPath: adbPath == freezed
          ? _value.adbPath
          : adbPath // ignore: cast_nullable_to_non_nullable
              as String,
      avdmanagerPath: avdmanagerPath == freezed
          ? _value.avdmanagerPath
          : avdmanagerPath // ignore: cast_nullable_to_non_nullable
              as String,
      emulatorPath: emulatorPath == freezed
          ? _value.emulatorPath
          : emulatorPath // ignore: cast_nullable_to_non_nullable
              as String,
      flutterPath: flutterPath == freezed
          ? _value.flutterPath
          : flutterPath // ignore: cast_nullable_to_non_nullable
              as String,
      xcrunPath: xcrunPath == freezed
          ? _value.xcrunPath
          : xcrunPath // ignore: cast_nullable_to_non_nullable
              as String,
      verbose: verbose == freezed
          ? _value.verbose
          : verbose // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Config implements _Config {
  const _$_Config(
      {required this.adbPath,
      required this.avdmanagerPath,
      required this.emulatorPath,
      required this.flutterPath,
      required this.xcrunPath,
      required this.verbose});

  @override
  final String adbPath;
  @override
  final String avdmanagerPath;
  @override
  final String emulatorPath;
  @override
  final String flutterPath;
  @override
  final String xcrunPath;
  @override
  final bool verbose;

  @override
  String toString() {
    return 'Config(adbPath: $adbPath, avdmanagerPath: $avdmanagerPath, emulatorPath: $emulatorPath, flutterPath: $flutterPath, xcrunPath: $xcrunPath, verbose: $verbose)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Config &&
            const DeepCollectionEquality().equals(other.adbPath, adbPath) &&
            const DeepCollectionEquality()
                .equals(other.avdmanagerPath, avdmanagerPath) &&
            const DeepCollectionEquality()
                .equals(other.emulatorPath, emulatorPath) &&
            const DeepCollectionEquality()
                .equals(other.flutterPath, flutterPath) &&
            const DeepCollectionEquality().equals(other.xcrunPath, xcrunPath) &&
            const DeepCollectionEquality().equals(other.verbose, verbose));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(adbPath),
      const DeepCollectionEquality().hash(avdmanagerPath),
      const DeepCollectionEquality().hash(emulatorPath),
      const DeepCollectionEquality().hash(flutterPath),
      const DeepCollectionEquality().hash(xcrunPath),
      const DeepCollectionEquality().hash(verbose));

  @JsonKey(ignore: true)
  @override
  _$ConfigCopyWith<_Config> get copyWith =>
      __$ConfigCopyWithImpl<_Config>(this, _$identity);
}

abstract class _Config implements Config {
  const factory _Config(
      {required String adbPath,
      required String avdmanagerPath,
      required String emulatorPath,
      required String flutterPath,
      required String xcrunPath,
      required bool verbose}) = _$_Config;

  @override
  String get adbPath;
  @override
  String get avdmanagerPath;
  @override
  String get emulatorPath;
  @override
  String get flutterPath;
  @override
  String get xcrunPath;
  @override
  bool get verbose;
  @override
  @JsonKey(ignore: true)
  _$ConfigCopyWith<_Config> get copyWith => throw _privateConstructorUsedError;
}
