import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renjuki2/global/shared_widgets/custom_button.dart';

import '../../../../global/app_theme/app_styles.dart';
import '../../../../global/app_theme/icon_broken.dart';
import '../../../../global/shared_widgets/reusable_components.dart';

class SignInScreen extends StatefulWidget {
  static const SIGNINSCREEN = 'SignInscreen';
  final bool isAdmin;
  const SignInScreen({this.isAdmin = false, Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isLoading = false;

  Map<String, String> userInfo = {'username': '', 'email': '', 'password': ''};

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  final _keyScaffold = GlobalKey<ScaffoldState>();

  void _submit({
    required String username,
    required String email,
    required String password,
    required BuildContext context,
  }) {
    FocusScope.of(context).unfocus();

    if (!_keyForm.currentState!.validate()) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    const bool isEnglish = true;
    // final _lang = Provider.of<LanguageProvider>(context, listen: false);
    // final bool isEnglish =
    //     Provider.of<LanguageProvider>(context, listen: true).isEnglish;
    // final _userValue = Provider.of<UserProvider>(context, listen: false);
    // final fromWhere = ModalRoute.of(context)?.settings.arguments as Product?;
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            key: _keyScaffold,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: const Icon(IconBroken.Close_Square),
                  onPressed: () => context.go('/home'),
                )
              ],
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Form(
                        key: _keyForm,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Align(
                                alignment: isEnglish
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'WELCOME BACK..\n',
                                        style: AppStyles.getStyleOpen(context),
                                      ),
                                      TextSpan(
                                        text: 'PLEASE SIGN IN',
                                        style: AppStyles.styleOpen,
                                      ),
                                      // TextSpan(text: 'SIGN UP'),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 6,
                                ),
                                elevation: 20,
                                shadowColor: Colors.black.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(4),
                                        width: double.infinity,
                                        height: 55,
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'please enter you email or phone';
                                            }
                                          },
                                          textDirection: isEnglish
                                              ? TextDirection.ltr
                                              : TextDirection.ltr,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            labelText: 'Email',
                                          ),
                                          onSaved: (value) {
                                            userInfo['email'] = value!.trim();
                                          },
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.all(4),
                                          width: double.infinity,
                                          height: 55,
                                          child: TextFormField(
                                              obscureText: true,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty ||
                                                    value.length < 6) {
                                                  return 'password should be at least 6 letters';
                                                }
                                              },
                                              onSaved: (value) {
                                                userInfo['password'] =
                                                    value!.trim();
                                              },
                                              textDirection: isEnglish
                                                  ? TextDirection.ltr
                                                  : TextDirection.ltr,
                                              textInputAction:
                                                  TextInputAction.next,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  labelText: 'Password',
                                                  suffix: IconButton(
                                                    onPressed: () {
                                                      // _userValue.changeShowPassword();
                                                    },
                                                    icon: const Icon(
                                                        IconBroken.Password),
                                                  )))),

                                      if (_isLoading)
                                        const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      CustomButton(
                                        fun: _isLoading
                                            ? null
                                            : () {
                                                _keyForm.currentState!.save();

                                                _submit(
                                                  username:
                                                      userInfo['username']!,
                                                  email: userInfo['email']!,
                                                  password:
                                                      userInfo['password']!,
                                                  context: context,
                                                );
                                              },
                                        title: 'SIGN IN',
                                        icon: IconBroken.Login,
                                      ),

                                      customDivider(),

                                      // CustomElevatedIconButton(
                                      //   function: () {
                                      //     Navigator.of(context).push(
                                      //       MaterialPageRoute(
                                      //         builder: (ctx) => PhoneSingIn(),
                                      //         fullscreenDialog: true,
                                      //       ),
                                      //     );
                                      //   },
                                      //   text: 'Sign in Using Phone Number',
                                      //   icon: const Icon(
                                      //     IconBroken.Login,
                                      //     color: Colors.white,
                                      //   ),
                                      // ),

                                      // Text('- or -'),

                                      CustomMaterialButton(
                                        function: () {
                                          context.go(
                                            '/signup',
                                          );
                                        },
                                        text: 'If No Account, Sign Up',
                                        color: Colors.white,
                                        // color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ])))))));
  }
}
