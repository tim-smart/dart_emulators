import 'dart:io';

import 'package:elemental/elemental.dart';
import 'package:emulators/emulators.dart';
import 'package:emulators/src/flutter.dart';
import 'package:emulators/src/utils/strings.dart';

part 'platforms/android_device.dart';
part 'platforms/ios_device.dart';
part 'platforms/unimplemented_device.dart';

typedef DeviceIO<A> = EIO<DeviceError, A>;
typedef ToolchainIO<A> = ZIO<Toolchain, DeviceError, A>;

enum Appearance {
  light,
  dark,
}

abstract class PlatformDevice {
  DeviceState get state;

  DeviceIO<Unit> get boot;
  DeviceIO<Unit> get shutdown;
  DeviceIO<Unit> get cleanStatusBar;
  DeviceIO<List<int>> get screenshot;
  DeviceIO<Unit> get maybeResolveName;
  DeviceIO<Unit> setState(DeviceState state);
  DeviceIO<Unit> setAppearance(Appearance appearance);

  static ToolchainIO<Unit> waitUntilRunning(PlatformDevice device) =>
      findRunning(device.state).flatMap(
        (_) => _.match(
          () => waitUntilRunning(device).delay(const Duration(seconds: 2)),
          (running) => device.setState(running.state).lift(),
        ),
      );
}

final findRunning = (DeviceState s) => ToolchainIO.envWithZIO(
      (env) => Flutter(env).running().mapError(
            (l) => DeviceError.flutterFailure(
              op: 'isRunning',
              error: l,
            ),
          ),
    ).map((devices) => devices.firstOption);
