import 'dart:io';

import 'package:emulators/src/utils/process.dart';

/// A utility for executing the command with the given [path].
class Command {
  const Command({required this.path, this.prefixArgs});

  final String path;

  /// Args to prefix to all runs.
  final List<String>? prefixArgs;

  /// Execute the command with the given [args].
  Future<String> execute(List<String> args, {
    Map<String, String>? env,
  }) {
    return run(path, [
      ...(prefixArgs ?? []),
      ...args,
    ], env: env);
  }

  /// Execute the command and parse the results as binary.
  Future<List<int>> executeBinary(List<String> args, {
    Map<String, String>? env,
  }) {
    return runBinary(path, [
      ...(prefixArgs ?? []),
      ...args,
    ], env: env);
  }

  /// Execute the command and parse the results as json.
  Future<dynamic> executeJson(List<String> args, {
    Map<String, String>? env,
  }) {
    return runJson(path, [
      ...(prefixArgs ?? []),
      ...args,
    ], env: env);
  }

  Future<Process> startProcess(List<String> args, {
    Map<String, String>? env,
  }) {
    return start(path, [
      ...(prefixArgs ?? []),
      ...args,
    ], env: env);
  }
}
