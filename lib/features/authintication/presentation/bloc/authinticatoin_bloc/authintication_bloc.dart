


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/authintication/presentation/bloc/authinticatoin_bloc/authintication_events.dart';
import 'package:renjuki2/features/authintication/presentation/bloc/authinticatoin_bloc/authintication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationStates,AuthenticationEvent>{
  AuthenticationBloc():super(AuthSignUpStateInit());
}