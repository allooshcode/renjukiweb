
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../global/app_theme/icon_broken.dart';
import '../../../../global/shared_widgets/reusable_components.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _lang = Provider.of<LanguageProvider>(context, listen: false);
    // final user = Provider.of<UserProvider>(context, listen: false);

    return  const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            IconBroken.Heart,
            color: Colors.red,
          ),
        );
    //         : const Icon(Icons.favorite_border),
    //     onPressed: () async {
    //       if (Provider.of<UserProvider>(context, listen: false).isAuth()) {
    //         try {
    //           final connectivityResult =
    //           await Connectivity().checkConnectivity();
    //           if (connectivityResult == ConnectivityResult.none) {
    //             ScaffoldMessenger.of(context).showSnackBar(
    //               SnackBar(
    //                 content: Text(_lang.getText('No Connection!').toString()),
    //               ),
    //             );
    //
    //             return;
    //           }
    //           productnow.changeLoadingFavorite();
    //           productnow
    //               .addRemoveFavorite(
    //             productnow,
    //             user.user().currentUser!.uid,
    //           )
    //               .then((value) {
    //             productnow.changeLoadingFavorite();
    //             if (productnow.favorite) {
    //               customSnackBar('Item Added to Favorites', context, _lang);
    //             } else {
    //               customSnackBar(
    //                 'Item Removed from Favorites',
    //                 context,
    //               );
    //             }
    //           });
    //         } on FirebaseAuthException catch (err) {
    //           ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //
    //           ScaffoldMessenger.of(context)
    //               .showSnackBar(SnackBar(content: Text(err.toString())));
    //         } catch (err) {
    //           ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //           ScaffoldMessenger.of(context)
    //               .showSnackBar(SnackBar(content: Text(err.toString())));
    //         }
    //       } else {
    //         customSnackBar('PLEASE SIGN IN FIRST', context, );
    //       }
    //     },
    //   ),
    // );
  }
}