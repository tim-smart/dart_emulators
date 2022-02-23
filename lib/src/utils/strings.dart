import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart';

Iterable<String> splitLines(String input) =>
    input.trim().split("\n").map((s) => s.trim());

Option<String> stringOption(String? input) =>
    fromNullable(input).p(map((s) => s.trim())).p(filter((s) => s.isNotEmpty));
