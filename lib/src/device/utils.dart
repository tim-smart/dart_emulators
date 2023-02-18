import 'dart:io';

import 'package:emulators/src/device.dart';
import 'package:emulators/src/toolchain.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/reader_task_either.dart' as RTE;
import 'package:fpdt/state_reader_task_either.dart';

typedef DeviceOp<R>
    = StateReaderTaskEither<DeviceState, Toolchain, DeviceError, R>;

DeviceOp<DeviceState> opGet() => get();
DeviceOp<A> opDo<A>(DoFunction<DeviceState, Toolchain, DeviceError, A> f) =>
    Do(f);

ReaderTaskEither<Toolchain, DeviceError, A> toolchainDo<A>(
  RTE.DoFunction<Toolchain, DeviceError, A> f,
) =>
    RTE.Do(f);

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

final logOrElse = <C, L, R>(R r) => RTE.alt<C, L, R>((left) {
      stderr.writeln(left);
      return RTE.right(r);
    });
