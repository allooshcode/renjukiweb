import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:renjuki2/global/errors/failures.dart';
import 'package:renjuki2/global/services/network_services.dart';

import '../models/user_model.dart';

abstract class AuthUserDataAbstract extends Equatable {
  Future<Either<Failure, UserModel>> signUp(String email, String password);
  Future<Either<Failure, UserModel>> signIn(String email, String password);
}

class AuthUserData extends Equatable implements AuthUserDataAbstract {

  FireBaseAuthService fireBaseAuthService;

  AuthUserData(this.fireBaseAuthService);


  @override
  Future<Either<Failure, UserModel>> signUp(String email,
      String password) async {
    try {
      UserCredential userCredential = await fireBaseAuthService.firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      debugPrint(userCredential.user.toString());
      return right(UserModel.fromJson({
        'userEmail': userCredential.user!.email,
        'userName': userCredential.user!.email
      }));
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());

      return left(ServerFuilure(e.code));
    }catch(err){
      debugPrint(err.toString());

      return left(ServerFuilure(err.toString()));

    }
  }




  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


  @override
  Future<Either<Failure,UserModel>> signIn(String email, String password) async{

  try{

  UserCredential userCredential = await fireBaseAuthService.firebaseAuth.signInWithEmailAndPassword(
  email: email,
  password: password
  );
  print('No user found for that email.');

  debugPrint(userCredential.user?.email);
  return right(UserModel.fromJson({
  'userEmail': userCredential.user!.email,
  'userName': userCredential.user!.email
  }));
  }on FirebaseAuthException catch(err){
    if (err.code == 'user-not-found') {
      return left(ServerFuilure(err.code));} else if (err.code == 'wrong-password') {
      return left(  ServerFuilure(err.code));    }else {
        return left(  ServerFuilure(err.code));
      }

  }catch(err){return left(  ServerFuilure(err.toString()));
  }


  }


}






