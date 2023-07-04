import 'package:flutter/material.dart';

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

  void _submit(
      {required String username,
      required String email,
      required String password,
      required BuildContext context,
      Product? fromWhere,
     }) {
    FocusScope.of(context).unfocus();

    if (!_keyForm.currentState!.validate()) {
      return;
    }
    setState(() {
      _isLoading = !_isLoading;
    });
    // try {

    Provider.of<UserProvider>(context, listen: false)
        .signIn(email, password, isAdmin: widget.isAdmin)
        .then((value) {
      if (value == null) {
        setState(() {
          _isLoading = !_isLoading;
        });
        return;
      }
      debugPrint('...................');
      // Provider.of<UserProvider>(context, listen: false).getUserRole();
      Provider.of<UserProvider>(context, listen: false).singInNow = true;
      HiveHelper.addUserToken(token: value.user!.refreshToken!);
      // Provider.of<UserProvider>(context, listen: false).userToken =
      //     value.credential!.token!;

      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(lang.getText('signed').toString())),
        );
        _isLoading = !_isLoading;
        // });

        // Phoenix.rebirth(context);
        if (fromWhere == null) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (ctx) =>
                  kIsWeb ? const ViewControllerWeb() : const ViewController(),
            ),
            (_) => false,
          );
        } else {
          Navigator.of(context).popAndPushNamed(
            ProductDetails.productdetails,
            arguments: fromWhere,
          );
        }
      });
    }).catchError((err) {
      if (mounted) {
        setState(() {
          _isLoading = !_isLoading;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(err.toString()),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _lang = Provider.of<LanguageProvider>(context, listen: false);
    final bool isEnglish =
        Provider.of<LanguageProvider>(context, listen: true).isEnglish;
    final _userValue = Provider.of<UserProvider>(context, listen: false);
    final fromWhere = ModalRoute.of(context)?.settings.arguments as Product?;
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
              icon: const Icon(IconBroken.Close_Square),
              onPressed: () => Navigator.of(context).pop(),
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
                child: Column(
                  children: [
                    Align(
                      alignment: isEnglish
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${_lang.getText('WELCOME BACK..')}\n',
                              style: AppStyles.getStyleOpen(context),
                            ),
                            TextSpan(
                              text: _lang.getText('PLEASE SIGN IN').toString(),
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
                                    return _lang
                                        .getText(
                                          'please enter you email or phone',
                                        )
                                        .toString();
                                  }
                                },
                                textDirection: isEnglish
                                    ? TextDirection.ltr
                                    : TextDirection.ltr,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  labelText: _lang.getText('Email').toString(),
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
                              child: Selector<UserProvider, bool>(
                                selector: (ctx, showPassword) =>
                                    showPassword.showPassword,
                                builder: (ctx, showPassword, ch) {
                                  return TextFormField(
                                    obscureText: showPassword,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length < 6) {
                                        return _lang
                                            .getText(
                                              'password should be at least 6 letters',
                                            )
                                            .toString();
                                      }
                                    },
                                    onSaved: (value) {
                                      userInfo['password'] = value!.trim();
                                    },
                                    textDirection: isEnglish
                                        ? TextDirection.ltr
                                        : TextDirection.ltr,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      labelText:
                                          _lang.getText('Password').toString(),
                                      suffix: IconButton(
                                        onPressed: () {
                                          _userValue.changeShowPassword();
                                        },
                                        icon: Selector<UserProvider, bool>(
                                          selector: (ctx, showPassword) =>
                                              showPassword.showPassword,
                                          builder: (ctx, showPassword, ch) {
                                            return showPassword
                                                ? const Icon(IconBroken.Show)
                                                : const Icon(IconBroken.Hide);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            if (_isLoading)
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                            CustomElevatedIconButton(
                              function: _isLoading
                                  ? null
                                  : () async {
                                      _keyForm.currentState!.save();

                                      _submit(
                                          username: userInfo['username']!,
                                          email: userInfo['email']!,
                                          password: userInfo['password']!,
                                          context: context,
                                          fromWhere: fromWhere,
                                          lang: _lang);
                                    },
                              text: 'SIGN IN',
                              icon: const Icon(IconBroken.Login),
                            ),

                            customDivider(),

                            CustomElevatedIconButton(
                              function: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => PhoneSingIn(),
                                    fullscreenDialog: true,
                                  ),
                                );
                              },
                              text: 'Sign in Using Phone Number',
                              icon: const Icon(
                                IconBroken.Login,
                                color: Colors.white,
                              ),
                            ),

                            // Text('- or -'),

                            CustomMaterialButton(
                              function: () {
                                Navigator.of(context).pushNamed(SignUp.Signup);
                              },
                              text: 'Sign Up', color: Colors.white,
                              // color: Colors.black,
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
        ),
      ),
    );
  }
}
