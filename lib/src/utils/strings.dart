import 'package:fpdt/fpdt.dart';
import 'package:fpdt/option.dart';

extension StringUtils on String {
  Iterable<String> splitLines() =>
      trim().split("\n").map((s) => s.trim());
}

Option<String> stringOption(String? input) => fromNullable(input)
    .chain(map((s) => s.trim()))
    .chain(filter((s) => s.isNotEmpty));
