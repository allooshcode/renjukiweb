
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:renjuki2/features/authintication/data/models/user_model.dart';
import 'package:renjuki2/global/errors/failures.dart';

class SignUpUserData extends Equatable{

  Future<Either<Failure,UserModel>> signUp(String email, String password) async {

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return right(UserModel.fromJson(userCredential.credential!.asMap()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }


  }


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}