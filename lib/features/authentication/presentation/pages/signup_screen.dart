import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';

import '../../../../container_injection.dart';
import '../../../../global/app_theme/app_styles.dart';
import '../../../../global/app_theme/icon_broken.dart';
import '../../../../global/shared_widgets/reusable_components.dart';

class SignUpScreen extends StatefulWidget {
  // final _auth = FirebaseAuth.instance;
  static const String Signup = 'SignUp';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final AuthBloc authBloc = sl<AuthBloc>();

  Map<String, String> userInfo = {'username': '', 'email': '', 'password': ''};

  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  final _keyScaffold = GlobalKey<ScaffoldState>();

  Future _submit(String username, String email, String password,
      BuildContext context) async {
    _keyForm.currentState?.validate();
    context.read<AuthBloc>().add(SignUpEvent(email, password));
    debugPrint('signup button .....');
  }

  @override
  Widget build(BuildContext context) {
    const bool isEnglish = true;

    return Directionality(
      textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        key: _keyScaffold,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.close),
              onPressed: () => context.go('/login'),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              context.go('/home', extra: state);
            }

            if (state is SignUpFailureState) {
              showToast(state.error.toString());
            }
          },
          builder: (context, state) {
            debugPrint('$state');
            // if (state is SignUpLoadingState) {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            return SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _keyForm,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: isEnglish
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Please sign up..',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 36,
                                    fontFamily: 'Quicksand-Bold',
                                  ),
                                ),
                                // TextSpan(text: 'SIGN UP'),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 6),
                          elevation: 10,
                          shadowColor: Colors.black.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  width: double.infinity,
                                  height: 50,
                                  child: TextFormField(
                                    textDirection: TextDirection.ltr,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please add your name';
                                      }
                                    },
                                    onSaved: (value) {
                                      userInfo['username'] = value!;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      label: const Text('your Name'),
                                      border: AppStyles.outLinedBorder,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  width: double.infinity,
                                  height: 50,
                                  child: TextFormField(
                                    textDirection: TextDirection.ltr,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please add an email address';
                                      }
                                      if (!value.endsWith('.com') ||
                                          !value.contains('@')) {
                                        return 'enter valid email address';
                                      }
                                    },
                                    onSaved: (value) {
                                      userInfo['email'] = value!.trim();
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      label: const Text('Email Address'),
                                      border: AppStyles.outLinedBorder,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  width: double.infinity,
                                  height: 50,
                                  child: TextFormField(
                                    obscureText: true,

                                    textDirection: TextDirection.ltr,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) {
                                      userInfo['password'] = value!.trim();
                                    },
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'please enter a password';
                                      }
                                      if (value.length < 6) {
                                        return 'password at least 6 letters';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsetsDirectional.only(
                                        start: 10,
                                        end: -5,
                                        bottom: 15,
                                      ),
                                      // suffix: const SuffixIcon(),
                                      border: AppStyles.outLinedBorder,
                                      label: const Text(
                                        'Confirm Password',
                                      ),
                                    ),
                                    controller: _passwordController,

                                    // obscureText: _userValue.showPassword,
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  width: double.infinity,
                                  height: 50,
                                  child: TextFormField(
                                    obscureText: true,

                                    onSaved: (value) {
                                      userInfo['password'] = value!.trim();
                                    },
                                    validator: (value) {
                                      if (value != _passwordController.text) {
                                        return "password does not match";
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsetsDirectional.only(
                                        start: 10,
                                        end: -5,
                                        bottom: 15,
                                      ),
                                      // suffix: const SuffixIcon(),
                                      border: AppStyles.outLinedBorder,
                                      label: const Text(
                                        'Confirm Password',
                                      ),
                                    ),
                                    textInputAction: TextInputAction.done,
                                    textDirection: TextDirection.ltr,
                                    // obscureText: _userValue.showPassword,
                                  ),
                                ),
                                //
                                Visibility(
                                    visible: (state is SignUpLoadingState),
                                    child: const CircularProgressIndicator()),
                                CustomElevatedIconButton(
                                  function: () {
                                    _keyForm.currentState!.save();
                                    _submit(
                                      userInfo['username']!,
                                      userInfo['email']!,
                                      userInfo["password"]!,
                                      context,
                                    );
                                  },
                                  text: 'Proceed',
                                  icon: const Icon(IconBroken.Login),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          // listener: (BuildContext context, state) {
          //   debugPrint('$state');
          //   if (state is SignUpSuccessState) {
          //     showToast('Signed Up Successfully');
          //     context.go('/home');
          //   }
          //   if (state is SignUpLoadingState) {
          //     const Center(child: CircularProgressIndicator());
          //   }
          // },
        ),
      ),
    );
  }
}
