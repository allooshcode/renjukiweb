import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../global/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repository/SignUpRepository.dart';

class SignUpUseCase extends Equatable {
  final SignUpRepository signUpRepository;
  const SignUpUseCase({required this.signUpRepository});

  Future<Either<Failure, UserEntity>> call(
      String email, String password) async {
    return signUpRepository.signup(email, password);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
