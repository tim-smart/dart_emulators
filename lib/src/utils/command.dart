import 'dart:io';

import 'package:emulators/src/utils/process.dart';

/// A utility for executing the command with the given [path].
class Command {
  const Command({required this.path, this.prefixArgs, this.verbose = false});

  final String path;

  /// Args to prefix to all runs.
  final List<String>? prefixArgs;

  final bool verbose;

  /// Execute the command with the given [args].
  Future<String> execute(
    List<String> args, {
    Map<String, String>? env,
  }) {
    return run(path, [...(prefixArgs ?? []), ...args], verbose, env: env);
  }

  /// Execute the command and parse the results as binary.
  Future<List<int>> executeBinary(
    List<String> args, {
    Map<String, String>? env,
  }) {
    return runBinary(path, [...(prefixArgs ?? []), ...args], verbose, env: env);
  }

  /// Execute the command and parse the results as json.
  Future<dynamic> executeJson(
    List<String> args, {
    Map<String, String>? env,
  }) {
    return runJson(path, [...(prefixArgs ?? []), ...args], verbose, env: env);
  }

  Future<Process> startProcess(
    List<String> args, {
    Map<String, String>? env,
  }) {
    return start(path, [...(prefixArgs ?? []), ...args], verbose, env: env);
  }
}
