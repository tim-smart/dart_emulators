import 'dart:convert';
import 'dart:io';

Future<String> run(String exec, List<String> args) => Process.run(
      exec,
      args,
      stdoutEncoding: Utf8Codec(),
    ).then((r) => r.stdout.trim());

Future<dynamic> runJson(String exec, List<String> args) =>
    run(exec, args).then(json.decode);

Future<List<int>> runBinary(String exec, List<String> args) => Process.run(
      exec,
      args,
    ).then((r) => r.stdout);
