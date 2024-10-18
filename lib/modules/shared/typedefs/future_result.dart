import 'package:dartz/dartz.dart';

import '../data/failures.dart';

typedef FutureResult<T> = Future<Either<Failure, T>>;
