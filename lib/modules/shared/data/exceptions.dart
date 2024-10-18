import 'package:iplay_flutter/modules/shared/data/failures.dart';

import '../shared_strings.dart';

class ParseDataException implements CustomError {
  ParseDataException(this.error);

  @override
  final String message = SharedStrings.exceptions.parseDataException;
  final String error;
}
