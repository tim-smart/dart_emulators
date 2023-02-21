import 'package:elemental/elemental.dart';

Iterable<String> splitLines(String input) =>
    input.trim().split("\n").map((s) => s.trim());

Option<String> stringOption(String? input) =>
    Option.fromNullable(input).map((s) => s.trim()).filter((s) => s.isNotEmpty);
