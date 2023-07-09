import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../global/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repository/auth_Repository.dart';

class AuthUseCase extends Equatable {
  final AuthRepository authRepository;
  const AuthUseCase({required this.authRepository});

  Future<Either<Failure, UserEntity>> signUp(
      String email, String password) async {
    return authRepository.signup(email, password);
  }

  Future<Either<Failure, UserEntity>> signIn(email, password) {
    return authRepository.signIn(email, password);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
