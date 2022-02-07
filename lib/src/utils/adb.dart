import 'package:emulators/src/device_state.dart';
import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart' as O;

Option<DeviceState> parseDevicesLine(String input) => O
        .some(input.split('•').map((s) => s.trim()).toList())
        .chain(O.filter((parts) => parts.length == 4))
        .chain(O.map((parts) {
      final name =
          parts[0].replaceAll(RegExp(r'\((web|mobile|desktop)\)'), '').trim();
      final id = parts[1];
      final kind = parseKind(parts[2]);
      final emulator = RegExp(r'(emulator|simulator)').hasMatch(parts[3]);

      return DeviceState(
        id: id,
        name: name,
        platform: kind,
        emulator: emulator,
        booted: true,
      );
    }));

DevicePlatform parseKind(String input) {
  if (input.contains('ios')) {
    return DevicePlatform.ios;
  } else if (input.contains('android')) {
    return DevicePlatform.android;
  }

  return DevicePlatform.unimplemented;
}
