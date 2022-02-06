import 'package:emulators/emulators.dart';

Future<void> main() async {
  // This runs your app for all the combinations of the provided devices and
  // locales.
  // Your app will be launched via the provided app target file.

  // Once your app is running for a given device and locale, Emulators will look
  // for and run a `..._test.dart` file in the same directory as your app
  // target.
  // eg if your app target is `foo/main.dart`,there must also exist a
  // `foo/main_test.dart`. In the test file you can interact with the app while
  // it is running using the flutter test packages. You can trigger screenshots
  // via `await emulators.takeScreenshot();`.
  runEmulatedApp(
    appTarget: 'test_driver/main.dart',
    locales: ['en', 'fr'],
    devices: [
      'iPhone 8 Plus',
      'iPhone 12 Pro',
      'Nexus_5X',
    ],
  );
}
