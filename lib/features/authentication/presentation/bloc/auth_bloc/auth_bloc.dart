import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/authentication/domain/entities/user_entity.dart';

import '../../../../homepage/presentation/bloc/home_bloc/home_bloc.dart';
import '../../../domain/usecases/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;
  late UserEntity? user;

  AuthBloc({required this.authUseCase, this.user}) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      debugPrint('sign up event work...');
      emit(SignUpLoadingState());
      final response = await authUseCase.signUp(event.email, event.password);
      response.fold((l) => emit(SignUpFailureState(l.msgError)), (r) {
        user = r;
        emit(SignUpSuccessState());
      });
    });

    on<SignInEvent>((event, emit) async {
      debugPrint('sign in event work...');
      emit(SignInLoadingState());
      final response = await authUseCase.signIn(event.email, event.password);
      response.fold((l) => emit(SignInFailureState(l.msgError)), (r) {
        user = r;
        emit(SignInSuccessState());
      });
    });
  }

  void closeAuthPage() {}
}
