import 'package:emulators/src/device.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:fpdt/state_reader_task_either.dart';

typedef DeviceOp<R>
    = StateReaderTaskEither<DeviceState, Toolchain, DeviceError, R>;

DeviceOp<Toolchain> opAsk() => ask();

DeviceOp<R> op<R>({
  required DeviceOp<R> android,
  required DeviceOp<R> ios,
}) =>
    (s) => s.platform == DevicePlatform.ios ? ios(s) : android(s);
