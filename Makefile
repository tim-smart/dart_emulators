.PHONY: build-runner
build-runner:
	pm2 start --no-daemon "flutter pub run build_runner watch --delete-conflicting-outputs"
