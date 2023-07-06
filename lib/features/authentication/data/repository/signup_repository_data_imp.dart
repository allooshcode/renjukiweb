import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import 'package:renjuki2/global/errors/failures.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repository/SignUpRepository.dart';
import '../data_sources/signup_user_data.dart';

class SignUpRepositoryDataImp implements SignUpRepository {
  final SignUpUserData signUpUserData;
  SignUpRepositoryDataImp(this.signUpUserData);

  @override
  Future<Either<Failure, UserEntity>> signup(String email, String password) {
    return signUpUserData.signUp(email, password);

    return signUpUserData.signUp(email, password);
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
