# emulators

A utility library to automate mobile emulators.

Can be used to automate screenshots on multiple devices.

## Example project

https://github.com/tim-smart/flutter-emulators-screenshots-demo

This project demonstrates how to use this package to generate screenshots for a
Flutter project.

# FAQ

## iOS status bar not aesthetically correct

Make sure you have iOS 16 or lower in the simulator (so not iOS 16.1 or higher) if you want a default status bar (time, battery, etc.) to make it the same for all screenshots.

Make sure you have iOS 15.5 or lower in the simulator for phones (such as iPhone 8 Plus) that have the carrier name in the status bar, so the plugin will remove it and add cellular signal bars.

See https://stackoverflow.com/questions/74507031/xcrun-simctl-status-bar-not-working-on-xcode-14-1

## Random errors / hangs with Android emulators

You might hit an `adb` bug. A symptom is that the output of the command
`adb -s emulator-5554 emu avd name` is **empty** when the emulator is running
(where `emulator-5554` is the name of your emulator).

If the file `~/.emulator_console_auth_token` **exists and is empty**, stop the
emulator and remove the file.

See https://github.com/tim-smart/dart_emulators/issues/4 for more info.
