import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/pages/auth_page.dart';
import 'package:renjuki2/container_injection.dart';

class SignInSignUp extends StatelessWidget {
  const SignInSignUp({super.key, required this.authBloc});
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Welcome to RENJUKI!',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle Sign In button pressed
              // You can navigate to the Sign In page or perform any desired action
            },
            child: const Text('Sign In'),
          ),
          const SizedBox(height: 8.0),
          OutlinedButton(
            onPressed: () {
              authBloc.add(GoSignupEvent());
              // Handle Sign Up button pressed
              // You can navigate to the Sign Up page or perform any desired action
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
