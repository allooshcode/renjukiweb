import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseAuthService extends Equatable {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FirebaseFireStoreServices extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FirebaseFire extends Equatable {
  final FirebaseFireStoreServices _fireStoreServices =
      FirebaseFireStoreServices();

  FirebaseFireStoreServices get firebaseFire => _fireStoreServices;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
