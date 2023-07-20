import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/container_injection.dart';
import 'package:renjuki2/features/homepage/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:renjuki2/global/app_theme/app_styles.dart';
import 'package:renjuki2/main.dart';
import '../../../../global/router/app_router.dart';

class SignInSignUp extends StatelessWidget {
  const SignInSignUp({
    super.key,
  });
  // final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (MediaQuery.of(context).size.width > 580)
            Text('Welcome to RENJUKI!  ', style: AppStyles.googleStyle),
          ElevatedButton(
            onPressed: () {
              context.go('/login'); // authBloc.add(GoSignupEvent());

              // Handle Sign In button pressed
              // You can navigate to the Sign In page or perform any desired action
            },
            child: const Text('Sign In'),
          ),
          const SizedBox(height: 8.0),
          // OutlinedButton(
          //   onPressed: () {
          //     // Handle Sign Up button pressed
          //     // You can navigate to the Sign Up page or perform any desired action
          //   },
          //   child: const Text('Sign Up'),
          // ),
        ],
      ),
    );
  }
}
