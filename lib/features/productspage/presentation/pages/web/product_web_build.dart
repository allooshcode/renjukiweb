import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:renjuki2/global/utils/constants.dart';

import '../../../domain/entity/product_entity.dart';
import '../../wedgits/product_widget_item.dart';


class ProductsWebBuild extends StatelessWidget {
  const ProductsWebBuild({Key? key, required this.productList}) : super(key: key);

  final List<ProductEntity> productList;

  @override
  Widget build(BuildContext context) {



    return  GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,            // physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.2,
              crossAxisSpacing: 10,
              crossAxisCount: 4,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (ctx, i) =>   ProductWebItemW(product: productList[i],),

            itemCount: productList.length,
          );
        }


  }
