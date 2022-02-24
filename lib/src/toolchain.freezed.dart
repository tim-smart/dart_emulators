// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'toolchain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ToolchainTearOff {
  const _$ToolchainTearOff();

  _Toolchain call(
      {required String adbPath,
      required String avdmanagerPath,
      required String emulatorPath,
      required String flutterPath,
      required String xcrunPath}) {
    return _Toolchain(
      adbPath: adbPath,
      avdmanagerPath: avdmanagerPath,
      emulatorPath: emulatorPath,
      flutterPath: flutterPath,
      xcrunPath: xcrunPath,
    );
  }
}

/// @nodoc
const $Toolchain = _$ToolchainTearOff();

/// @nodoc
mixin _$Toolchain {
  String get adbPath => throw _privateConstructorUsedError;
  String get avdmanagerPath => throw _privateConstructorUsedError;
  String get emulatorPath => throw _privateConstructorUsedError;
  String get flutterPath => throw _privateConstructorUsedError;
  String get xcrunPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToolchainCopyWith<Toolchain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolchainCopyWith<$Res> {
  factory $ToolchainCopyWith(Toolchain value, $Res Function(Toolchain) then) =
      _$ToolchainCopyWithImpl<$Res>;
  $Res call(
      {String adbPath,
      String avdmanagerPath,
      String emulatorPath,
      String flutterPath,
      String xcrunPath});
}

/// @nodoc
class _$ToolchainCopyWithImpl<$Res> implements $ToolchainCopyWith<$Res> {
  _$ToolchainCopyWithImpl(this._value, this._then);

  final Toolchain _value;
  // ignore: unused_field
  final $Res Function(Toolchain) _then;

  @override
  $Res call({
    Object? adbPath = freezed,
    Object? avdmanagerPath = freezed,
    Object? emulatorPath = freezed,
    Object? flutterPath = freezed,
    Object? xcrunPath = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$ToolchainCopyWith<$Res> implements $ToolchainCopyWith<$Res> {
  factory _$ToolchainCopyWith(
          _Toolchain value, $Res Function(_Toolchain) then) =
      __$ToolchainCopyWithImpl<$Res>;
  @override
  $Res call(
      {String adbPath,
      String avdmanagerPath,
      String emulatorPath,
      String flutterPath,
      String xcrunPath});
}

/// @nodoc
class __$ToolchainCopyWithImpl<$Res> extends _$ToolchainCopyWithImpl<$Res>
    implements _$ToolchainCopyWith<$Res> {
  __$ToolchainCopyWithImpl(_Toolchain _value, $Res Function(_Toolchain) _then)
      : super(_value, (v) => _then(v as _Toolchain));

  @override
  _Toolchain get _value => super._value as _Toolchain;

  @override
  $Res call({
    Object? adbPath = freezed,
    Object? avdmanagerPath = freezed,
    Object? emulatorPath = freezed,
    Object? flutterPath = freezed,
    Object? xcrunPath = freezed,
  }) {
    return _then(_Toolchain(
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
    ));
  }
}

/// @nodoc

class _$_Toolchain extends _Toolchain {
  const _$_Toolchain(
      {required this.adbPath,
      required this.avdmanagerPath,
      required this.emulatorPath,
      required this.flutterPath,
      required this.xcrunPath})
      : super._();

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
  String toString() {
    return 'Toolchain(adbPath: $adbPath, avdmanagerPath: $avdmanagerPath, emulatorPath: $emulatorPath, flutterPath: $flutterPath, xcrunPath: $xcrunPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Toolchain &&
            const DeepCollectionEquality().equals(other.adbPath, adbPath) &&
            const DeepCollectionEquality()
                .equals(other.avdmanagerPath, avdmanagerPath) &&
            const DeepCollectionEquality()
                .equals(other.emulatorPath, emulatorPath) &&
            const DeepCollectionEquality()
                .equals(other.flutterPath, flutterPath) &&
            const DeepCollectionEquality().equals(other.xcrunPath, xcrunPath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(adbPath),
      const DeepCollectionEquality().hash(avdmanagerPath),
      const DeepCollectionEquality().hash(emulatorPath),
      const DeepCollectionEquality().hash(flutterPath),
      const DeepCollectionEquality().hash(xcrunPath));

  @JsonKey(ignore: true)
  @override
  _$ToolchainCopyWith<_Toolchain> get copyWith =>
      __$ToolchainCopyWithImpl<_Toolchain>(this, _$identity);
}

abstract class _Toolchain extends Toolchain {
  const factory _Toolchain(
      {required String adbPath,
      required String avdmanagerPath,
      required String emulatorPath,
      required String flutterPath,
      required String xcrunPath}) = _$_Toolchain;
  const _Toolchain._() : super._();

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
  @JsonKey(ignore: true)
  _$ToolchainCopyWith<_Toolchain> get copyWith =>
      throw _privateConstructorUsedError;
}
