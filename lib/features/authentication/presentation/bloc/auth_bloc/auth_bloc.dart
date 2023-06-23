import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../homepage/presentation/bloc/home_bloc/home_bloc.dart';
import '../../../domain/usecases/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;
  bool _isAuthPageOpen = false;
  bool get isAuthPage => _isAuthPageOpen;

  AuthBloc({required this.signUpUseCase}) : super(AuthInitial()) {
    on<AuthPageOpenedEvent>((event, emit) {
      _isAuthPageOpen = true;
      emit(AuthPageOpenState());

      // emit(GoSignUpState());
    });

    on<CloseAuthPageEvent>((event, emit) {
      _isAuthPageOpen = false;
      emit(AuthPageClosedState());

      // emit(GoSignUpState());
    });

    on<SignUpEvent>((event, emit) async {
      emit(SignUpLoadingState());
      final response = await signUpUseCase.call(event.email, event.password);
      response.fold((l) => emit(SignUpFailureState(l.msgError)),
          (r) => emit(SignUpSuccessState()));
    });
  }

  void closeAuthPage() {}
}
