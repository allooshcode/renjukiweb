

import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity implements Equatable{

  static const String USERNAME = 'userName';
  static const String USEREMAIL = 'userEmail';
  static const String ISADMIN = "isAdmin";

  static const String ADDRESS = 'userAddress';
  static const String USERPHONE = 'userPhone';

  UserModel({required super.userName, required super.userEmail, required super.isAdmin,
    required super.address, required super.userPhone});


  factory UserModel.fromJson(Map<String,dynamic> snapshot){
    return  UserModel(userName: snapshot[USERNAME], userEmail: snapshot[USEREMAIL],
        isAdmin: snapshot[ISADMIN], address: snapshot[ADDRESS]?? '', userPhone: snapshot[USERPHONE])


  }



}