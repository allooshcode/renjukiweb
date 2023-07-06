part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class GoSignUpState extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpLoadingState extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpSuccessState extends AuthState {
  // final UserEntity userEntity;
  // const SignUpSuccessState(this.userEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpFailureState extends AuthState {
  final String error;

  const SignUpFailureState(this.error);

  @override
  List<Object> get props => [error];
}

class SignInLoadingState extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignInSuccessState extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignInFailureState extends AuthState {
  final String error;

  const SignInFailureState(this.error);

  @override
  List<Object> get props => [error];
}
