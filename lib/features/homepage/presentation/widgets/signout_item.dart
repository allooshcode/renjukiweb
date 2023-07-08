import 'package:flutter/material.dart';

import '../../../../global/app_theme/app_styles.dart';
import '../../../../global/app_theme/icon_broken.dart';

class SignOutItem extends StatefulWidget {
  const SignOutItem({Key? key}) : super(key: key);

  @override
  _SignOutItemState createState() => _SignOutItemState();
}

class _SignOutItemState extends State<SignOutItem> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListTile(
          title: Row(
            children: [
              if (isLoading == true)
                const Center(child: CircularProgressIndicator()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'SIGN OUT',
                  style: AppStyles.styleSnasR,
                ),
              ),
            ],
          ),
          leading: const Icon(IconBroken.Logout),
          onTap: () async {
            try {
              setState(() {
                isLoading = true;
              });

              // await Provider.of<UserProvider>(context, listen: false)
              //     .signOut(context)
              //     .then((value) {
              //   Provider.of<UserPointsProvider>(context, listen: false)
              //       .userPoint = null;
              //
              //   setState(() {
              //     isLoading = false;
              //   });
              // });
            } catch (err) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    err.toString(),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
