
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{


  final String? userName;
  final String? userEmail;
  bool isAdmin = false;
  final String? address;
  final String? userPhone;

  UserEntity({
    required this.userName,
    required this.userEmail,
    required this.isAdmin,
    required this.address,
    required this.userPhone,
  });


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}