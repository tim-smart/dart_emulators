## 0.7.0

- update dependencies
- add support for toggling dark/light mode

## 0.6.1

- prioritise `which` for avdmanager

## 0.6.0

- Update dependencies

## 0.5.1

- fix type error when resolving ios device names

## 0.5.0

- drop dart v2
- add shutdown timeout option to forEach

## 0.4.13

- pub upgrade

## 0.4.12

- Allow disabling the ScreenshotHelper, for running tests without screenshots.

## 0.4.11

- Add optional `modifyState` callback to Device#clone

## 0.4.10

- Update deps

## 0.4.9

- Support `ANDROID_HOME` environment variable

## 0.4.8

- Absorb errors in list operation, so it works if a platform is missing

## 0.4.7

- Clean up exports some more

## 0.4.6

- Export `Toolchain`, `ScreenshotHelper` and `ProcessRunner`.

## 0.4.5

- Log error if device in `forEach` is not found.

## 0.4.4

- Internal refactor

## 0.4.3

- Internal refactor

## 0.4.2

- Export device types

## 0.4.1

- Loosen `nameOrIds` in `forEach` to an `Iterable` type

## 0.4.0

- BREAKING: Rewrite API surface to make package easier to use

## 0.2.3

- Add support for passing custom config

## 0.2.1

- Handle bad output from adb emu avd commands

## 0.2.0

- Update dart SDK and dependencies - @ened

## 0.1.16

- Documentation updates

## 0.1.15

- Add date to ios `cleanStatusBar`

## 0.1.14

- Don't absorb errors in `forEach`

## 0.1.13

- Add `args` to `drive`

## 0.1.12

- Reliability improvements

## 0.1.11

- Bug fixes

## 0.1.10

- Refactor internal `waitUntilRunning`

## 0.1.9

- Filter out real devices

## 0.1.8

- Set wifi signal in android `cleanStatusBar`
- Remove `shutdownAll` from `forEach`

## 0.1.7+1

- Add link to example project to README

## 0.1.7

- Create directories for screenshots

## 0.1.6

- Add `cleanStatusBarFromEnv` for use with flutter driver

## 0.1.5

- Refactor `cleanStatusBar` into it's own function

## 0.1.4

- Add some delay after `shutdown`
- Fix android demo mode

## 0.1.3

- Increase timeout to 60s for `waitUntilRunning`

## 0.1.2

- Add `avdmanager` and expose helper functions

## 0.1.1

- Clean iOS status bar for screenshots

## 0.1.0+1

- Rename example

## 0.1.0

- First release
