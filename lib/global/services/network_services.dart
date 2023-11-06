import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// abstract class FirebaseServices<Type, param> {
//   final Type _fireService = Type.instance;

//   Type get fireService => _fireService;
// }

// class NoParam{

// }

// class FireStrorage implements FirebaseServices<FirebaseStorage,NoParam> {
//   @override
//   get _fireService => ;

//   @override
//   // TODO: implement fireService
//   get fireService => throw UnimplementedError();

// }

class FireBaseStorage extends Equatable {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  FirebaseStorage get firebaseStorage => _firebaseStorage;

  @override
  List<Object?> get props => throw UnimplementedError();
}

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
