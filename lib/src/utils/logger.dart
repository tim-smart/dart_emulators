import 'dart:io';

import 'package:elemental/elemental.dart';

final stdoutLogger = loggerLayer.replace(IO.succeed(Logger((message) {
  stderr.writeln(message);
})));
