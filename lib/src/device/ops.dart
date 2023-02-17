import 'dart:io';

import 'package:emulators/emulators.dart';
import 'package:emulators/src/device/platforms/android.dart' as android;
import 'package:emulators/src/device/platforms/ios.dart' as ios;
import 'package:emulators/src/device/utils.dart';
import 'package:emulators/src/flutter.dart' as flutter;
import 'package:fpdt/either.dart' as E;
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:fpdt/task_either.dart' as TE;
import 'package:fpdt/reader_task_either.dart' as RTE;
import 'package:fpdt/state_reader_task_either.dart' as SRTE;

final list = RTE.sequence([
  android.list.p(logOrElse(IList())),
  ios.list.p(logOrElse(IList())),
]).p(RTE.map((l) => l.expand<Device>(identity).toIList()));

// == forEach
typedef ProcessDevice = Future<void> Function(Device);

final _findDevice = (IList<Device> devices) => (String nameOrId) => devices
    .firstWhereOption((d) => d.state.id == nameOrId || d.state.name == nameOrId)
    .p(E.fromOption(() => DeviceError.foreachFailure(
          phase: '_findDevice',
          message: 'Could not find device: $nameOrId',
        )));

final _processDevice =
    (ProcessDevice process, Duration timeout) => (Device d) => TE
        .tryCatch(
          () => d.boot().then((_) => d.clone()),
          (err, stackTrace) => DeviceError.foreachFailure(
            phase: 'boot',
            message: err.toString(),
            device: d.state,
          ),
        )
        .p(TE.chainTryCatchK(
          (booted) async {
            try {
              await d.waitUntilRunning(timeout: timeout);
              await process(d);
            } finally {
              await booted.shutdown();
            }
          },
          (err, stackTrace) => DeviceError.foreachFailure(
            phase: 'process',
            message: err.toString(),
            device: d.state,
          ),
        ))
        .p(TE.asUnit);

final forEach = ({
  required ProcessDevice process,
  required Iterable<String> nameOrIds,
  Duration timeout = const Duration(minutes: 3),
}) =>
    toolchainDo(($, tc) async {
      final devices = await $(list);

      final task = nameOrIds
          .map(_findDevice(devices)
              .c(TE.fromEither)
              .c(TE.flatMap(_processDevice(process, timeout)))
              .c(TE.tapLeft((left) => stderr.writeln(left)))
              .c(TE.orElse(TE.unit())))
          .p(TE.sequence);
      await $(RTE.fromTaskEither(task));

      return unit;
    });

final boot = platformOp(
  android: android.boot,
  ios: ios.boot,
);

final shutdown = platformOp(
  android: android.shutdown,
  ios: ios.shutdown,
);

final shutdownAll = flutter
    .running()
    .p(RTE.mapLeft((l) => DeviceError.flutterFailure(
          op: 'shutdownAll',
          error: l,
        )))
    .p(RTE.flatMap(
      (devices) => devices.map((d) => shutdown(d.state)).p(RTE.sequence),
    ))
    .p(RTE.map((_) => unit));

final cleanStatusBar = platformOp(
  android: android.cleanStatusBar,
  ios: ios.cleanStatusBar,
);

final screenshot = platformOp(
  android: android.screenshot,
  ios: ios.screenshot,
);

final maybeResolveName = platformOp(
  android: android.maybeResolveName,
  ios: ios.maybeResolveName,
);

final findRunning = (DeviceState s) => flutter
    .running()
    .p(RTE.map((devices) => devices.firstWhereOption((d) => d.similar(s))))
    .p(RTE.mapLeft((l) => DeviceError.flutterFailure(
          op: 'isRunning',
          error: l,
        )));

final DeviceOp<Unit> waitUntilRunning =
    opGet().p(SRTE.flatMapReaderTaskEither(findRunning)).p(SRTE.flatMap(O.fold(
          () => opGet()
              .p(SRTE.delay(const Duration(seconds: 2)))
              .p(SRTE.zipRight(waitUntilRunning)),
          (running) => SRTE.put(running.state),
        )));
