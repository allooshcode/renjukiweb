import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';
import 'package:renjuki2/features/productspage/presentation/wedgits/product_item_mobile.dart';


class ProductsMobileBuild extends StatelessWidget {
  const ProductsMobileBuild({Key? key, required this.productList}) : super(key: key);
  final List<ProductEntity> productList;

  @override
  Widget build(BuildContext context) {

    // final _product = Provider.of<Products>(context, listen: false);

    // final latestLength =
    //     Provider.of<Products>(context, listen: false).latestProducts.length;



          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.2,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (ctx, i) => InkWell(
                onTap: (){
                  context.goNamed('ProductDetails',pathParameters:{'name':productList[i].productName},extra:productList[i], );
                },
                child: ProductItemMobile(product: productList[i])),

            itemCount:productList.length ,

    );
  }
}