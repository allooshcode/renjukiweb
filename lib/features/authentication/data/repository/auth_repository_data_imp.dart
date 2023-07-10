import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import 'package:renjuki2/global/errors/failures.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_Repository.dart';
import '../data_sources/auth_user_data.dart';

class AuthRepositoryDataImp implements AuthRepository {
  final AuthUserData auhUserData;
  AuthRepositoryDataImp(this.auhUserData);

  @override
  Future<Either<Failure, UserEntity>> signup(String email, String password) {
    return auhUserData.signUp(email, password);
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(String email, String password) {
    return auhUserData.signIn(email, password);
  }

  @override
  Future<Either<Failure, UserEntity>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
