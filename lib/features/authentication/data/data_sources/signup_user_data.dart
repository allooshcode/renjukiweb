import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:renjuki2/global/errors/exceptions.dart';
import 'package:renjuki2/global/errors/failures.dart';

import '../models/user_model.dart';

class SignUpUserData extends Equatable {
  Future<Either<Failure, UserModel>> signUp(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return right(UserModel.fromJson(userCredential.credential!.asMap()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(ServerFuilure(e.code));
      } else if (e.code == 'email-already-in-use') {
        return left(const ServerFuilure('The account '
            'already exists for that email.'));
      }
    } on ServerException catch (e) {
      return left(ServerFuilure(e.msgError));
    }
    return left(const ServerFuilure('something went wrong!'));
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
