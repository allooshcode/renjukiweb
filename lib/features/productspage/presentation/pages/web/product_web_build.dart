import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            itemBuilder: (ctx, i) =>   InkWell(
                onTap: (){
                  context.goNamed('ProductDetails',pathParameters:{'name':productList[i].productName},extra:productList[i], );
                },
                child: ProductWebItemW(product: productList[i],)),

            itemCount: productList.length,
          );
        }


  }
