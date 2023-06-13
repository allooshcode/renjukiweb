import 'package:equatable/equatable.dart';

abstract class AuthenticationStates extends Equatable{


  const AuthenticationStates();
}

class AuthSignUpStateInit extends AuthenticationStates{

  const AuthSignUpStateInit();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();



}


class AuthSignUpStateDone extends AuthenticationStates{

  const AuthSignUpStateDone();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();



}

class AuthSignUpStateError extends AuthenticationStates{

  const AuthSignUpStateError();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();



}


