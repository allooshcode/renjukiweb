import 'package:flutter/material.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';
import 'package:renjuki2/features/productspage/presentation/wedgits/add_to_cart_button.dart';
import 'package:renjuki2/features/productspage/presentation/wedgits/favourite_icon.dart';
import 'package:renjuki2/features/productspage/presentation/wedgits/grid_tile_web_item.dart';

class ProductWebItemW extends StatelessWidget {
  const ProductWebItemW({Key? key, required this.product}) : super(key: key);

  // final QueryDocumentSnapshot productsDoc;
  // ProductItemW(this.productsDoc);
  final ProductEntity product;
  // ProductItemW(this.product);
  @override
  Widget build(BuildContext context) {
    // final _media = MediaQuery.of(context).size;
    // final _orientation = MediaQuery.of(context).orientation;
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
              GridTileWebItem(product: product),

              const FavoriteIcon(),
              // if (Provider.of<Product>(
              //   context,
              // ).isLoadingAddingFavorite)
              //   const Center(
              //     child: CircularProgressIndicator(),
              //   ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Text(
                // productsDoc[Product.NAME],
                product.productName,
                style: const TextStyle(
                  color: Colors.black,
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
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
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
