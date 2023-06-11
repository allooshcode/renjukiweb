import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../global/errors/failures.dart';

abstract class SignUpRepository extends Equatable {
  Future<Either<Failure, bool>> signup();
}
