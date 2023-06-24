import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/container_injection.dart';
import 'package:renjuki2/global/router/app_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key,required this.authBloc});
  final AuthBloc authBloc;

  // void navigateBackToHomePage(BuildContext context) {
  //   final routerDelegate = Router.of(context).routerDelegate as AppRouterDelegate;
  //   routerDelegate.setInitialRoutePath(RoutePath.home());
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: const Text('Sign Up'),),

      body: BlocProvider(
        create: (context) => AuthBloc(signUpUseCase:sl() ),
        child: BlocConsumer<AuthBloc, AuthState>(
            builder: (BuildContext context, state) {
              if (state is SignUpSuccessState) {
              }


              return const Center(child: Text('sign up'));
            },
            listener: (BuildContext context, state) {}),
      ),
    );
  }
}
