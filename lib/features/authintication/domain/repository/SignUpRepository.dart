import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:renjuki2/features/authintication/domain/entities/user_entity.dart';

import '../../../../global/errors/failures.dart';

abstract class SignUpRepository extends Equatable {
  Future<Either<Failure, UserEntity>> signup(String email, String password);
}
