# emulators

A utility library to automate mobile emulators.

Can be used to automate screenshots on multiple devices.

## Example project

https://github.com/tim-smart/flutter-emulators-screenshots-demo

This project demonstrates how to use this package to generate screenshots for a
Flutter project.

# FAQ

## Random errors / hangs with Android emulators

You might hit an `adb` bug. A symptom is that the output of the command `adb -s emulator-5554 emu avd name` is **empty** when the emulator is running (please replace `emulator-5554` with the name of your emulator).

Check the file `~/.emulator_console_auth_token`: if it **exists and it's empty**, stop the emulator and remove the file.

See https://github.com/tim-smart/dart_emulators/issues/4 for more info.
