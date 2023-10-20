import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseAuthService extends Equatable {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FirebaseFireService extends Equatable {
  final FirebaseFirestore _fireStoreServices = FirebaseFirestore.instance;

  FirebaseFirestore get firebaseFire => _fireStoreServices;

  @override
  List<Object?> get props => throw UnimplementedError();
}
