import 'package:elemental/elemental.dart';
import 'package:emulators/src/device.dart';

DeviceIO<R> platformOp<R>({
  required DeviceIO<R> android,
  required DeviceIO<R> ios,
}) =>
    DeviceIO.envWith((env) => env.state.platform)
        .filterOrFail(
          (a) => a != DevicePlatform.unimplemented,
          (a) => const DeviceError.unimplemented(),
        )
        .flatMapEnv((a, env) => a == DevicePlatform.ios ? ios : android);

extension ZIOLogOrElse<R, E, A> on ZIO<R, E, A> {
  RIO<R, A> logOrElse(A a) =>
      tapError((e) => ZIO.logWarn("$e")).getOrElse((e) => a);
}
