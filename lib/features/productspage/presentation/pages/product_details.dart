// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';


import '../../../../global/app_theme/app_styles.dart';
import '../../../../global/shared_widgets/reusable_components.dart';
import '../wedgits/add_cart_details_button.dart';
import '../wedgits/product_item_info.dart';

class ProductDetails extends StatefulWidget {

  final ProductEntity product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  // late String productID;
  bool isStarted = false;

  @override
  void didChangeDependencies() {
    if (!isStarted) {
      // product = ModalRoute.of(context)!.settings.arguments! as Product;



    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    isStarted = true;
  }

  @override
  Widget build(BuildContext context) {

    final deviceSize = MediaQuery.of(context).size;
    return Directionality(
      textDirection:  TextDirection.ltr,
      child: Scaffold(
        backgroundColor:Colors.white,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              // backgroundColor: Colors.black,
              floating: true,
              iconTheme: const IconThemeData(color: Colors.black),
              pinned: true,
              expandedHeight: 300,
              stretch: true, centerTitle: true,
              // snap: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Hero(
                    // key: Key(product.productID!),
                    tag: widget.product.productId,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.product.photoPath,
                      ),
                      placeholder: const AssetImage(
                        'assets/images/placeholder.jpg',
                      ),
                    ),
                  ),
                ),
                centerTitle: true,
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(
                    width: deviceSize.width,
                    // height: deviceSize.height,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        ProductInfoItem(
                          product: widget.product,
                          // choosedSize: choosedSize,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.product.description,
                            style: AppStyles.styleSnasR,
                          ),
                        ),
                        customDivider(),



                        const Divider(
                          indent: 20,
                          endIndent: 20,
                          thickness: 1,
                        ),

                      ],
                    ),
                  )
                ]))
          ],
        ),
        persistentFooterButtons: [
          AddCartButtonDetails(
            product: widget.product,

          )
        ],
      ),
    );
  }
}