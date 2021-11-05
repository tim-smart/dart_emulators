import 'package:fpdart/fpdart.dart';

Iterable<String> splitLines(String input) =>
    input.trim().split("\n").map((s) => s.trim());

Option<String> stringOption(String? input) =>
    optionOf(input).filter((s) => s.isNotEmpty);
