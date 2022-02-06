import 'dart:convert';
import 'dart:io';

Future<Process> start(
  String exec,
  List<String> args,
  bool verbose, {
  Map<String, String>? env,
}) async {
  if (verbose) {
    print('------');
    print(_commandAsString(exec, args));
  }
  return Process.start(
    exec,
    args,
    environment: env,
  );
}

Future<String> run(
  String exec,
  List<String> args,
  bool verbose, {
  Map<String, String>? env,
}) async {
  return _run(exec, args, Utf8Codec(), verbose, env: env).then((r) => r.stdout);
}

Future<ProcessResult> _run(
  String exec,
  List<String> args,
  Encoding? encoding,
  bool verbose, {
  Map<String, String>? env,
}) async {
  if (verbose) {
    print('------');
    print(_commandAsString(exec, args));
  }
  final ProcessResult result = await Process.run(
    exec,
    args,
    stdoutEncoding: encoding,
    environment: env,
  );
  assert(
    result.exitCode == 0,
    'Command failed with non-zero exit code (${result.exitCode}):\n'
    '  env: $env\n'
    '  cmd: ${_commandAsString(exec, args)}\n'
    '  error: ${result.stderr}',
  );
  return result;
}

String _commandAsString(
  String exec,
  List<String> args, {
  Map<String, String>? env,
}) {
  // Wrap any commands that contain white space in quotes.
  Iterable<String> cleanArgs =
      args.map((arg) => args.contains(' ') ? '"$arg"' : arg);
  return '$exec ${cleanArgs.join(' ')}';
}

Future<dynamic> runJson(
  String exec,
  List<String> args,
  bool verbose, {
  Map<String, String>? env,
}) =>
    run(exec, args, verbose, env: env).then(json.decode);

Future<List<int>> runBinary(
  String exec,
  List<String> args,
  bool verbose, {
  Map<String, String>? env,
}) =>
    _run(
      exec,
      args,
      null,
      verbose,
      env: env,
    ).then((r) => r.stdout as List<int>);
