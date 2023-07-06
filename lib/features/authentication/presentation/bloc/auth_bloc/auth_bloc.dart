import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/authentication/domain/entities/user_entity.dart';

import '../../../../homepage/presentation/bloc/home_bloc/home_bloc.dart';
import '../../../domain/usecases/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;
  bool _isAuthPageOpen = false;
  bool get isAuthPage => _isAuthPageOpen;

  AuthBloc({required this.signUpUseCase}) : super(AuthInitial()) {




    on<SignUpEvent>((event, emit) async {
      debugPrint('sign up event work...');
      emit(SignUpLoadingState());
      final response = await signUpUseCase.call(event.email, event.password);
      response.fold((l) => emit(SignUpFailureState(l.msgError)),
          (r) => emit(SignUpSuccessState()));
    });
  }

  void closeAuthPage() {}
}
