import 'dart:io';

import 'package:emulators/emulators.dart';
import 'package:emulators/src/device/platforms/android.dart' as android;
import 'package:emulators/src/device/platforms/ios.dart' as ios;
import 'package:emulators/src/device/utils.dart';
import 'package:emulators/src/flutter.dart' as flutter;
import 'package:fpdt/either.dart' as E;
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:fpdt/reader_task_either.dart' as RTE;
import 'package:fpdt/state_reader_task_either.dart' as SRTE;
import 'package:fpdt/task_either.dart' as TE;

// == list
final list = RTE.sequence([
  android.list.c(logOrElse(IList())),
  ios.list.c(logOrElse(IList())),
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
        .p(TE.flatMap(TE.tryCatchK(
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
        )));

final forEach = ({
  required ProcessDevice process,
  required Iterable<String> nameOrIds,
  Duration timeout = const Duration(minutes: 3),
}) =>
    list
        .p(RTE.flatMapTaskEither(
          (devices) => nameOrIds
              .map(_findDevice(devices)
                  .c(TE.fromEither)
                  .c(TE.flatMap(_processDevice(process, timeout)))
                  .c(logOrElse(null)))
              .p(TE.sequenceSeq),
        ))
        .p(RTE.map((_) => unit));

// == boot
final boot = platformOp(
  android: android.boot,
  ios: ios.boot,
);

// == shutdown
final shutdown = platformOp(
  android: android.shutdown,
  ios: ios.shutdown,
);

// == shutdownAll
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

// == cleanStatusBar
final cleanStatusBar = platformOp(
  android: android.cleanStatusBar,
  ios: ios.cleanStatusBar,
);

// == screenshot
final screenshot = platformOp(
  android: android.screenshot,
  ios: ios.screenshot,
);

// == maybeResolveName
final maybeResolveName = platformOp(
  android: android.maybeResolveName,
  ios: ios.maybeResolveName,
);

// == waitUntilRunning
final findRunning = (DeviceState s) => flutter
    .running()
    .p(RTE.map((devices) => devices.firstWhereOption((d) => d.similar(s))))
    .p(RTE.mapLeft((l) => DeviceError.flutterFailure(
          op: 'isRunning',
          error: l,
        )));

final DeviceOp<void> waitUntilRunning =
    opGet().p(SRTE.flatMapReaderTaskEither(findRunning)).p(SRTE.flatMap(O.fold(
          () => opGet()
              .p(SRTE.delay(const Duration(seconds: 2)))
              .p(SRTE.replace(waitUntilRunning)),
          (running) => SRTE.put(running.state),
        )));
