import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';
import 'package:renjuki2/features/productspage/presentation/wedgits/add_to_cart_button.dart';
import 'package:renjuki2/features/productspage/presentation/wedgits/favourite_icon.dart';
import 'package:renjuki2/features/productspage/presentation/wedgits/grid_tile_item_mobile.dart';

import '../../../../global/app_theme/icon_broken.dart';


class ProductItemMobile extends StatelessWidget {
  const ProductItemMobile({Key? key, required this.product}) : super(key: key);
  final ProductEntity product;

  // final QueryDocumentSnapshot productsDoc;
  // ProductItemW(this.productsDoc);
  // final Product product;
  // ProductItemW(this.product);
  @override
  Widget build(BuildContext context) {
    // // final _media = MediaQuery.of(context).size;
    // // final _orientation = MediaQuery.of(context).orientation;
    //
    // final user = Provider.of<UserProvider>(context, listen: false);
    // final product = Provider.of<Product>(context, listen: false);
    // // final _userID = user.user().currentUser?.uid;
    // final _cart = Provider.of<Cart>(context, listen: false);

    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Stack(
            children: [
              GridTileItem(product: product),
              // if (product.sale == true)
              //   Positioned(
              //     right: 10,
              //     top: 0,
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: const [
              //         CircleAvatar(
              //           backgroundColor: Colors.white,
              //           child: Icon(
              //             IconBroken.Discount,
              //             size: 36,
              //             color: Colors.red,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              const FavoriteIcon(),

            ],
          ),
        ),
        Container(
          padding: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: Column(
            children: [
              Text(
                // productsDoc[Product.NAME],
                product.productName,
                style: const TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 15,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                // overflow: TextOverflow.ellipsis,
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: AddToCartButton(
                  product: product,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}