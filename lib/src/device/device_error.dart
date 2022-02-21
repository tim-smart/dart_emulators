import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_error.freezed.dart';

@freezed
class DeviceError with _$DeviceError {
  const factory DeviceError.toolchainFailure({
    required String op,
    required String command,
    required String message,
  }) = DeviceErrorToolchainFailure;

  const factory DeviceError.processKillFailure({
    required String op,
    required String message,
  }) = DeviceErrorProcessKillFailure;

  const factory DeviceError.flutterFailure({
    required String op,
    required String command,
    required String message,
  }) = DeviceErrorFlutterFailure;

  const factory DeviceError.unimplemented() = DeviceErrorUnimplementedFailure;

  const factory DeviceError.foreachFailure({
    required String phase,
    required String message,
  }) = DeviceErrorForeachFailure;
}
