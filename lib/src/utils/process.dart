import 'dart:convert';
import 'dart:io';

class ProcessRunner {
  const ProcessRunner._({
    required this.exec,
    required this.args,
    this.env,
  });

  final String exec;
  final List<String> args;
  final Map<String, String>? env;

  Future<String> string() => Process.run(
        exec,
        args,
        stdoutEncoding: Utf8Codec(),
        environment: env,
      ).then((r) => r.stdout.trim());

  Future<dynamic> json() => string().then(jsonDecode);

  Future<List<int>> binary() => Process.run(
        exec,
        args,
        environment: env,
        stdoutEncoding: null,
      ).then((r) => r.stdout as List<int>);

  Future<Process> process() => Process.start(
        exec,
        args,
        environment: env,
      );
}

ProcessRunner run(
  String exec,
  List<String> args, {
  Map<String, String>? env,
}) =>
    ProcessRunner._(exec: exec, args: args, env: env);
