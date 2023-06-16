import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;

  AuthBloc({required this.signUpUseCase}) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(SignInLoadingState());
      final response = await signUpUseCase.call(event.email, event.password);
      response.fold((l) => emit(SignUpFailureState(l.msgError)),
          (r) => emit(SignUpSuccessState()));
    });
  }
}
