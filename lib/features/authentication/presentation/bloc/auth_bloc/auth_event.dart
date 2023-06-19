part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class GoSignupEvent extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LogoutEvent extends AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;

  const SignUpEvent(this.email, this.password);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent(this.email, this.password);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
