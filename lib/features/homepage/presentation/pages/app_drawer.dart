import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';

// import 'package:async/async.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../global/app_theme/app_styles.dart';
import '../../../../global/app_theme/icon_broken.dart';
import '../../../../global/shared_widgets/reusable_components.dart';
import '../../../../global/shared_widgets/text_item.dart';
import '../widgets/signout_item.dart';

class DrawerApp extends StatefulWidget {
  static const String drawerApp = 'DRAWER';

  const DrawerApp({Key? key}) : super(key: key);
  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  // final AsyncMemoizer _memoizer = AsyncMemoizer();

  bool isLoading = false;

  Future launchWhatsApp({
    required int phone,
    required String message,
  }) async {
    Uri url() {
      if (!kIsWeb) {
        // add the [https]
        return Uri.parse(
            "https://wa.me/$phone/?text=${Uri.parse(message)}"); // new line
      } else {
        // add the [https]
        return Uri.parse(
            "https://api.whatsapp.com/send?text=${Uri.parse(message)}"); // new line
      }
    }

    if (await canLaunchUrl(url())) {
      await launchUrl(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  Future<void> contactwhatsapp() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await launchWhatsApp(
        phone: 60104370100,
        message: 'nice to get touch with you, please how can help you ?',
      );
    } catch (err) {
      Fluttertoast.showToast(msg: err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthBloc>(context).user;
    debugPrint(user?.userEmail);

    const isEnglish = true;

    return Directionality(
      textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
      child: Drawer(
        key: const ValueKey('drawer'),
        elevation: 0,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 18),
          child: Column(
            children: [
              // ListTile(
              //   // title: _user.user().currentUser != null
              //   title: user != null
              //       ? user.user().currentUser!.phoneNumber != null
              //           ? Text(
              //               user.user().currentUser!.phoneNumber!,
              //               style: AppStyles.textStyle1,
              //             )
              //           : Text(
              //               user..email!,
              //               style: AppStyles.textStyle1,
              //             )
              //       : const TextItem(text:'Hello..'),
              //   leading: const Icon(IconBroken.User),
              //   onTap: () {
              //     // Navigator.of(context)
              //     //     .pushReplacementNamed(AuthScreen.authScreen);
              //   },
              // ),
              if (user == null)
                ListTile(
                  title: const TextItem(text: 'SIGN IN'),
                  leading: const Icon(Icons.how_to_reg),
                  onTap: () {
                    context.go('/login');
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(builder: (ctx) => AuthScreen()));
                  },
                ),
              customDivider(),
              ListTile(
                trailing: isEnglish
                    ? const Icon(IconBroken.Arrow___Right_2)
                    : const Icon(IconBroken.Arrow___Left_2),
                title: const TextItem(text: 'Contact us'),
                leading: const Icon(IconBroken.Message),
                onTap: () {
                  try {
                    contactwhatsapp();
                  } catch (err) {
                    showToast(err.toString());
                  }
                  // Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (ctx) => AuthScreen()));
                },
              ),
              customDivider(),
              if (user != null) const SignOutItem(),
            ],
          ),
        ),
      ),
    );
  }
}
