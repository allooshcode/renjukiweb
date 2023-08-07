import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService extends Equatable {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuth get firebaseAuth=>_firebaseAuth;



  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FirebaseFireStoreServices extends Equatable{


}
