import 'package:emulators/src/device.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/state_reader_task_either.dart';

typedef DeviceOp<R>
    = StateReaderTaskEither<DeviceState, Toolchain, DeviceError, R>;

DeviceOp<DeviceState> opGet() => get();

DeviceOp<R> platformOp<R>({
  required DeviceOp<R> android,
  required DeviceOp<R> ios,
}) =>
    opGet()
        .p(filter(
          (s) => s.platform != DevicePlatform.unimplemented,
          (s) => DeviceError.unimplemented(),
        ))
        .p(flatMap(
          (s) => s.platform == DevicePlatform.ios ? ios : android,
        ));
