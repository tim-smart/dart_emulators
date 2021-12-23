import 'dart:convert';
import 'dart:io';

import 'package:emulators/src/config.dart';
import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/platforms/android.dart' as android;
import 'package:emulators/src/utils/process.dart' as process;
import 'package:emulators/src/utils/strings.dart' as strings;
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;
import 'package:rxdart/rxdart.dart';

/// Wrapper for the `flutter` CLI tool.
final flutter = (Config config) => (
      List<String> args, {
      Map<String, String>? env,
    }) =>
        process.run(config.flutterPath, args, env: env);

/// Wrapper for the `flutter devices` command. Returns a stream of [Device]'s.
final running = (
  Config config, {
  bool onlyEmulators = true,
}) =>
    Stream.fromFuture(flutter(config)(['devices']))
        .flatMap((out) => Stream.fromIterable(strings.splitLines(out)))
        .flatMap<Device>((line) => _parseDevicesLine(line).chain(O.fold(
              () => Stream.empty(),
              (d) => Stream.value(d),
            )))
        .where((d) => onlyEmulators ? d.emulator : true)
        .asyncMap<Device>((d) =>
            d.emulator && d.platform == DevicePlatform.ANDROID
                ? android.updateDeviceName(config)(d)
                : Future.value(d))
        .handleError((_) => Stream.empty());

Option<Device> _parseDevicesLine(String input) => O
        .some(input.split('•').map((s) => s.trim()).toList())
        .chain(O.filter((parts) => parts.length == 4))
        .chain(O.map((parts) {
      final name =
          parts[0].replaceAll(RegExp(r'\((web|mobile|desktop)\)'), '').trim();
      final id = parts[1];
      final kind = _parseKind(parts[2]);
      final emulator = RegExp(r'(emulator|simulator)').hasMatch(parts[3]);

      return Device(
        id: id,
        name: name,
        platform: kind,
        emulator: emulator,
        booted: true,
      );
    }));

DevicePlatform _parseKind(String input) {
  if (input.contains('ios')) {
    return DevicePlatform.IOS;
  } else if (input.contains('android')) {
    return DevicePlatform.ANDROID;
  }

  return DevicePlatform.WEB;
}

/// Waits until the given [Device] is running, or errors with a timeout.
final waitUntilRunning = (Config config) => (
      Device device, {
      Duration timeout = const Duration(seconds: 100),
    }) =>
        Rx.merge([
          Stream.value(null),
          Stream.periodic(Duration(seconds: 1)),
        ])
            .exhaustMap((_) => running(config))
            .where((d) => d.similar(device))
            .first
            .timeout(timeout);

/// Wrapper for the `flutter` CLI tools. Runs a command and sets the
/// `EMULATORS_DEVICE` environment variable so you can easily take screenshots
/// etc.
final flutterWithDevice = (Config c) => (
      String command,
      Device device, {
      List<String> args = const [],
      Map<String, dynamic> config = const {},
    }) {
      final configJson = json.encode(config);
      final deviceJson = json.encode(device.toJson());

      return Process.start(c.flutterPath, [
        command,
        '-d',
        device.id,
        '--dart-define',
        'EMULATORS_CONFIG=$configJson',
        '--dart-define',
        'EMULATORS_DEVICE=$deviceJson',
        ...args,
      ], environment: {
        'EMULATORS_CONFIG': configJson,
        'EMULATORS_DEVICE': deviceJson,
      });
    };

/// Wrapper for the `flutter drive` CLI command. Runs it on the given [Device],
/// and sets the `EMULATORS_DEVICE` environment variable so you can easily take
/// screenshots etc. in your flutter_driver test script.
final drive = (Config c) => (
      Device device,
      String target, {
      List<String> args = const [],
      Map<String, dynamic> config = const {},
    }) =>
        flutterWithDevice(c)(
          'drive',
          device,
          args: [
            '--target=$target',
            ...args,
          ],
          config: config,
        );

/// Wrapper for the `flutter test` CLI command. Runs it on the given [Device],
/// and sets the `EMULATORS_DEVICE` environment variable so you can easily take
/// screenshots etc. in your integration test script.
final test = (Config c) => (
      Device device,
      String target, {
      List<String> args = const [],
      Map<String, dynamic> config = const {},
    }) =>
        flutterWithDevice(c)(
          'test',
          device,
          args: [target, ...args],
          config: config,
        );
