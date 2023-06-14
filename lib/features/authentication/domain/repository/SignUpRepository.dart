import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../global/errors/failures.dart';
import '../entities/user_entity.dart';

abstract class SignUpRepository extends Equatable {
  Future<Either<Failure, UserEntity>> signup(String email, String password);
}
