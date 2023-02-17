import 'dart:io';

import 'package:emulators/src/device.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/task_either.dart' as TE;
import 'package:fpdt/state_reader_task_either.dart';

typedef DeviceOp<R>
    = StateReaderTaskEither<DeviceState, Toolchain, DeviceError, R>;

DeviceOp<DeviceState> opGet() => get();
DeviceOp<A> opDo<A>(DoFunction<DeviceState, Toolchain, DeviceError, A> f) =>
    Do(f);

DeviceOp<R> platformOp<R>({
  required DeviceOp<R> android,
  required DeviceOp<R> ios,
}) =>
    opGet()
        .p(filter(
          (s) => s.platform != DevicePlatform.unimplemented,
          (s) => const DeviceError.unimplemented(),
        ))
        .p(flatMap(
          (s) => s.platform == DevicePlatform.ios ? ios : android,
        ));

final logOrElse = <L, R>(R r) => TE.alt<L, R>((left) {
      stderr.writeln(left);
      return TE.right(r);
    });
