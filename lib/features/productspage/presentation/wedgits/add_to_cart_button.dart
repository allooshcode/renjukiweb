import 'package:flutter/material.dart';

import '../../../../global/app_theme/app_styles.dart';
import '../../domain/entity/product_entity.dart';



class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key, required this.product}) : super(key: key);

  final ProductEntity product;
  @override
  Widget build(BuildContext context) {

    return TextButton(onPressed: (){}, child:  Text('Add to Cart',style: AppStyles.styleSnasR,));
    // final _cart = Provider.of<Cart>(context, listen: false);
    // final _lang = Provider.of<LanguageProvider>(context, listen: false);

    // final _userID = Provider.of<UserProvider>(
    //   context,
    // ).user().currentUser?.uid;
    // return TextButton(
    //   onPressed: _userID != null
    //       ? () async {
    //
    //     try {
    //       if (product.sizes!.isNotEmpty || product.flavours!.isNotEmpty) {
    //         Navigator.of(context)
    //             .pushNamed(
    //           ProductDetails.productdetails,
    //           arguments: product,
    //         )
    //             .then((value) {
    //           if (_cart.cartloading == true) {
    //             _cart.changeCartLoading();
    //           }
    //         });
    //         return;
    //       }
    //
    //       _cart.changeCartLoading();
    //
    //       await _cart
    //           .addCartItemAlready(
    //         product,
    //         product.quantity,
    //         _userID,
    //         '',
    //         '',
    //       )
    //           .then(
    //             (value) {
    //           customSnackBar(
    //             'great! Item added to Cart',
    //             context,
    //
    //           );
    //         },
    //       );
    //     } on FirebaseException catch (err) {
    //       _cart.changeCartLoading();
    //
    //       ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //       ScaffoldMessenger.of(context)
    //           .showSnackBar(SnackBar(content: Text(err.toString())));
    //     } catch (err) {
    //       _cart.changeCartLoading();
    //
    //       ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //       ScaffoldMessenger.of(context)
    //           .showSnackBar(SnackBar(content: Text(err.toString())));
    //     }
    //     // } else {
    //     //   customSnackBar('please check you connection',
    //     //       context, _lang);
    //     // }
    //   }
    //       : () {
    //     customSnackBar('please sign in first', context);
    //   },
    //   child: const Text(
    //     'Add To Cart',
    //     textAlign: TextAlign.center,
    //     style: TextStyle(color: Colors.white, fontSize: 15),
    //   ),
    // );
  }
}