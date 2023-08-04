import 'package:flutter/material.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';


import '../../../../global/app_theme/app_styles.dart';

class ProductInfoItem extends StatelessWidget {
  const ProductInfoItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {


    return ListTile(
      title: Text(
        product.productName,
        style: AppStyles.styleOpen,
      ),
      subtitle: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: Container(
          padding: const EdgeInsetsDirectional.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
          child:


              Text('RM ${product.productName}')


        ),
      ),
      // trailing: AddRemoveItemD(
      //   product: product,
      // ),
      //_addRemoveItemD(context, product),
    );
  }
}