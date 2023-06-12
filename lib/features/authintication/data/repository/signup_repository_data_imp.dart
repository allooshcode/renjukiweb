

import 'package:dartz/dartz.dart';
import 'package:renjuki2/features/authintication/data/data_sources/signup_user_data.dart';
import 'package:renjuki2/features/authintication/domain/entities/user_entity.dart';
import 'package:renjuki2/features/authintication/domain/repository/SignUpRepository.dart';
import 'package:renjuki2/global/errors/failures.dart';

class SignUpRepositoryDataImp implements SignUpRepository{
  final SignUpUserData signUpUserData;
  SignUpRepositoryDataImp(this.signUpUserData)


  @override
  Future<Either<Failure, UserEntity>> signup(String email,
      String password) {

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