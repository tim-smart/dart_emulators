import 'package:fpdt/function.dart';
import 'package:fpdt/option.dart';

Iterable<String> splitLines(String input) =>
    input.trim().split("\n").map((s) => s.trim());

Option<String> stringOption(String? input) => fromNullable(input)
    .chain(map((s) => s.trim()))
    .chain(filter((s) => s.isNotEmpty));
