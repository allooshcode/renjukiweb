
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable{

const AuthenticationEvent();

}

class SignUpEvent extends AuthenticationEvent{

  const SignUpEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}