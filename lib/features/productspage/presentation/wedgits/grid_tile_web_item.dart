import 'package:flutter/material.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';

class GridTileWebItem extends StatelessWidget {
  const GridTileWebItem({Key? key, required this.product}) : super(key: key);
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final _orientation = MediaQuery.of(context).orientation;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      child: GridTile(
        footer:  GridTileBar(
          backgroundColor: Colors.black54,
          // title:

          subtitle: FittedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ' ${product.productId}',

                  // 'RM ' + productsDoc[Product.PRICE]?.toString(),

                ),

              ],
            ),
          ),
          //  // Text('RM' + productsDoc[Product.PRICE].toString(),TextStyle(color: Colors.white, fontSize: 15),
          //  //   ),
          // leading: AddRemoveWebItem(product: product),
          //leading:,
        ),
        child: Hero(
          tag: product.productId!,
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: const AssetImage('logo.png'),
            image: NetworkImage(product.photoPath!),
          ),
        ),
      ),
    );
  }
}