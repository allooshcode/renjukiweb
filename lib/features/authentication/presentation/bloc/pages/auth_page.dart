import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: BlocConsumer<AuthBloc, AuthState>(
          builder: (BuildContext context, state) {
            if(state is SignUpSuccessState){
              Navigator.of(context).pushNamed('HomePage', );

            }



            return const Center(child: Text('sign up'));
          },
          listener: (BuildContext context, state) {}),
    );
  }
}
