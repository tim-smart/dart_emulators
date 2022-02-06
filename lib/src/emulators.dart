import 'dart:io';

import 'package:emulators/src/flutter.dart';
import 'package:emulators/src/models/device.dart';
import 'package:emulators/src/platforms/android.dart';
import 'package:emulators/src/platforms/emulation_layer.dart';
import 'package:emulators/src/platforms/ios.dart';
import 'package:path/path.dart';

import 'config.dart';

/// A wrapper around the various command line utilities for launching emulators
/// and running flutter apps on them.
class Emulators {
  Emulators._({required this.config})
      : flutter = Flutter(config),
        android = Android(config),
        ios = IOS(config);

  /// Automatically build a valid config and return an emulators client.
  static Future<Emulators> build({bool verbose = false}) async {
    final Config config = await buildConfig(verbose);
    return Emulators._(config: config);
  }

  final Config config;

  final Flutter flutter;

  final Android android;

  final IOS ios;

  String? _screenshotsPath;

  void setScreenshotsPath(String path) {
    _screenshotsPath = path;
  }

  /// Takes a [screenshot] and writes it to a file depending on the current
  /// [Device]'s platform.
  Future<void> takeScreenshot(String suffix) async {
    assert(
      _screenshotsPath != null,
      'Call `setScreenshotsPath` before trying to take any screenshots.',
    );
    final Device device = currentDevice();
    final file = '${device.name}_${getString('locale')!}_$suffix.png';
    final basePath = join(
      _screenshotsPath!,
      device.platform == DevicePlatform.IOS ? 'ios' : 'android',
    );

    final List<int> image = await _layer(device).screenshot(device);
    await Directory(basePath).create(recursive: true);
    await File(join(basePath, file)).writeAsBytes(image);
  }

  /// Takes a screenshot for the currently running device. Returns the
  /// screenshot in binary form as a `Future<List<int>>`.
  Future<List<int>> screenshot() {
    final Device device = currentDevice();
    return _layer(device).screenshot(device);
  }

  Future<List<Device>> listDevices() {
    return Future.wait<List<Device>>([
      android.listDevices(),
      ios.listDevices(),
    ]).then((d) => d.expand((subLst) => subLst).toList());
  }

  Future<void> cleanStatusBar() {
    final Device device = currentDevice();
    return _layer(device).cleanStatusBar(device);
  }

  Future<void> shutdownAll() async {
    final List<Device> runningDevices = await flutter.listRunningDevices();
    await Future.wait(runningDevices.map((d) => _layer(d).shutdown(d)));
  }

  /// Run the app at [appTarget] and any tests at `{app_target}_test.dart` for
  /// all combinations of [devices] and [locales].
  ///
  /// The [appTarget] is the relative path to your `main.dart` from the top
  /// directory of your flutter project. A `main_test.dart` file must exist in
  /// the same directory. Flutter will run the contents of `main_test.dart` while
  /// the app is running for each device and locale combination. You can interact
  /// with the running app (eg programmatically navigate the UI) from the test
  /// file via the `test/test.dart` package. You can trigger screenshots via
  /// `emulators.takeScreenshot();`.
  ///
  /// The [devices] may be device names and/or ids. At least one locale and one
  /// device must be provided.
  ///
  /// You can optionally provide arbitrary commands to be run against the
  /// emulator using [executeWhileRunning], though `*_test.dart` is generally
  /// an easier way to interact with the running app.
  Future<void> runEmulatedApp({
    required String appTarget,
    required List<String> locales,
    required List<String> devices,
    Future<void> Function(Emulators, Device, String)? executeWhileRunning,
  }) async {
    assert(locales.isNotEmpty, 'You must provide at least one locale!');
    assert(devices.isNotEmpty, 'You must provide at least one device!');
    final List<Device> availableDevices = await listDevices();
    for (String nameOrId in devices) {
      final Device? device = _getDevice(nameOrId, availableDevices);
      if (device == null) {
        print(
          'Device \'$nameOrId\' was not available, skipping. Check that it is '
          'available via `xcrun simctl` for ios or `emulator` for android.',
        );
        continue;
      }
      final EmulationLayer layer = _layer(device);
      await layer.boot(device);
      // We need to use the running device as the proper device id is not set on
      // Android until the device is running.
      final Device runningDevice = await flutter.waitUntilRunning(device);
      for (String locale in locales) {
        final Process process = await flutter.drive(
          device,
          appTarget,
          // Inject the locale into the flutter drive environment.
          commandConfig: {'locale': locale},
        );
        await stdout.addStream(process.stdout);
        await executeWhileRunning?.call(this, runningDevice, locale);
      }
      await layer.shutdown(device);
    }
  }

  EmulationLayer _layer(Device device) {
    if (device.platform == DevicePlatform.ANDROID) {
      return android;
    }
    return ios;
  }
}

Device? _getDevice(String nameOrId, List<Device> availableDevices) {
  for (final Device device in availableDevices) {
    if (device.id == nameOrId || device.name == nameOrId) {
      return device;
    }
  }
  return null;
}

/// Convenience wrapper around [Emulators.runEmulatedApp].
///
/// It automatically builds a configuration for you. See above for detailed
/// documentation.
Future<void> runEmulatedApp({
  required String appTarget,
  required List<String> locales,
  required List<String> devices,
  Future<void> Function(Emulators, Device, String)? executeWhileRunning,
  Duration timeout = const Duration(minutes: 3),
  bool verbose = false,
}) async {
  final Emulators emulators = await Emulators.build(verbose: verbose);
  return emulators
      .runEmulatedApp(
        appTarget: appTarget,
        locales: locales,
        devices: devices,
        executeWhileRunning: executeWhileRunning,
      )
      .timeout(timeout);
}
