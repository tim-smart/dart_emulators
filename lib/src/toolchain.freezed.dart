// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toolchain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Toolchain {
  String get adbPath;
  String get avdmanagerPath;
  String get emulatorPath;
  String get flutterPath;
  String get xcrunPath;

  /// Create a copy of Toolchain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToolchainCopyWith<Toolchain> get copyWith =>
      _$ToolchainCopyWithImpl<Toolchain>(this as Toolchain, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Toolchain &&
            (identical(other.adbPath, adbPath) || other.adbPath == adbPath) &&
            (identical(other.avdmanagerPath, avdmanagerPath) ||
                other.avdmanagerPath == avdmanagerPath) &&
            (identical(other.emulatorPath, emulatorPath) ||
                other.emulatorPath == emulatorPath) &&
            (identical(other.flutterPath, flutterPath) ||
                other.flutterPath == flutterPath) &&
            (identical(other.xcrunPath, xcrunPath) ||
                other.xcrunPath == xcrunPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, adbPath, avdmanagerPath,
      emulatorPath, flutterPath, xcrunPath);

  @override
  String toString() {
    return 'Toolchain(adbPath: $adbPath, avdmanagerPath: $avdmanagerPath, emulatorPath: $emulatorPath, flutterPath: $flutterPath, xcrunPath: $xcrunPath)';
  }
}

/// @nodoc
abstract mixin class $ToolchainCopyWith<$Res> {
  factory $ToolchainCopyWith(Toolchain value, $Res Function(Toolchain) _then) =
      _$ToolchainCopyWithImpl;
  @useResult
  $Res call(
      {String adbPath,
      String avdmanagerPath,
      String emulatorPath,
      String flutterPath,
      String xcrunPath});
}

/// @nodoc
class _$ToolchainCopyWithImpl<$Res> implements $ToolchainCopyWith<$Res> {
  _$ToolchainCopyWithImpl(this._self, this._then);

  final Toolchain _self;
  final $Res Function(Toolchain) _then;

  /// Create a copy of Toolchain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adbPath = null,
    Object? avdmanagerPath = null,
    Object? emulatorPath = null,
    Object? flutterPath = null,
    Object? xcrunPath = null,
  }) {
    return _then(_self.copyWith(
      adbPath: null == adbPath
          ? _self.adbPath
          : adbPath // ignore: cast_nullable_to_non_nullable
              as String,
      avdmanagerPath: null == avdmanagerPath
          ? _self.avdmanagerPath
          : avdmanagerPath // ignore: cast_nullable_to_non_nullable
              as String,
      emulatorPath: null == emulatorPath
          ? _self.emulatorPath
          : emulatorPath // ignore: cast_nullable_to_non_nullable
              as String,
      flutterPath: null == flutterPath
          ? _self.flutterPath
          : flutterPath // ignore: cast_nullable_to_non_nullable
              as String,
      xcrunPath: null == xcrunPath
          ? _self.xcrunPath
          : xcrunPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Toolchain extends Toolchain {
  const _Toolchain(
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

  /// Create a copy of Toolchain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToolchainCopyWith<_Toolchain> get copyWith =>
      __$ToolchainCopyWithImpl<_Toolchain>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Toolchain &&
            (identical(other.adbPath, adbPath) || other.adbPath == adbPath) &&
            (identical(other.avdmanagerPath, avdmanagerPath) ||
                other.avdmanagerPath == avdmanagerPath) &&
            (identical(other.emulatorPath, emulatorPath) ||
                other.emulatorPath == emulatorPath) &&
            (identical(other.flutterPath, flutterPath) ||
                other.flutterPath == flutterPath) &&
            (identical(other.xcrunPath, xcrunPath) ||
                other.xcrunPath == xcrunPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, adbPath, avdmanagerPath,
      emulatorPath, flutterPath, xcrunPath);

  @override
  String toString() {
    return 'Toolchain(adbPath: $adbPath, avdmanagerPath: $avdmanagerPath, emulatorPath: $emulatorPath, flutterPath: $flutterPath, xcrunPath: $xcrunPath)';
  }
}

/// @nodoc
abstract mixin class _$ToolchainCopyWith<$Res>
    implements $ToolchainCopyWith<$Res> {
  factory _$ToolchainCopyWith(
          _Toolchain value, $Res Function(_Toolchain) _then) =
      __$ToolchainCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String adbPath,
      String avdmanagerPath,
      String emulatorPath,
      String flutterPath,
      String xcrunPath});
}

/// @nodoc
class __$ToolchainCopyWithImpl<$Res> implements _$ToolchainCopyWith<$Res> {
  __$ToolchainCopyWithImpl(this._self, this._then);

  final _Toolchain _self;
  final $Res Function(_Toolchain) _then;

  /// Create a copy of Toolchain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? adbPath = null,
    Object? avdmanagerPath = null,
    Object? emulatorPath = null,
    Object? flutterPath = null,
    Object? xcrunPath = null,
  }) {
    return _then(_Toolchain(
      adbPath: null == adbPath
          ? _self.adbPath
          : adbPath // ignore: cast_nullable_to_non_nullable
              as String,
      avdmanagerPath: null == avdmanagerPath
          ? _self.avdmanagerPath
          : avdmanagerPath // ignore: cast_nullable_to_non_nullable
              as String,
      emulatorPath: null == emulatorPath
          ? _self.emulatorPath
          : emulatorPath // ignore: cast_nullable_to_non_nullable
              as String,
      flutterPath: null == flutterPath
          ? _self.flutterPath
          : flutterPath // ignore: cast_nullable_to_non_nullable
              as String,
      xcrunPath: null == xcrunPath
          ? _self.xcrunPath
          : xcrunPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
