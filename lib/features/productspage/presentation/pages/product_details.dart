// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suriashop/models/product.dart';
import 'package:suriashop/providers/Products.dart';
import 'package:suriashop/providers/language_porvider.dart';
import 'package:suriashop/screens/product_details_screen/components/add_cart_button_details.dart';
import 'package:suriashop/screens/product_details_screen/components/comment_button.dart';
import 'package:suriashop/screens/product_details_screen/components/product_info.dart';
import 'package:suriashop/screens/product_details_screen/components/product_size_flavour.dart';
import 'package:suriashop/shared/components/reusable_components.dart';
import 'package:suriashop/shared/style/app_styles.dart';

class ProductDetails extends StatefulWidget {
  static const productdetails = 'ProdcutDetails';

  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late final String choosedFalvor;
  late final String choosedSize;
  late Product product;
  // late String productID;
  bool isStarted = false;

  @override
  void didChangeDependencies() {
    if (!isStarted) {
      product = ModalRoute.of(context)!.settings.arguments! as Product;
      // productID = product.productID!;
      // product = Provider.of<Products>(context).findProductbyID(productID);
      if (product.sizes!.isNotEmpty) {
        Provider.of<Products>(context, listen: false).chooseSize =
        product.sizes!.keys.toList()[0];
        // choosedSize = product.sizes!.keys.toList()[0];
      }
      if (product.flavours!.isNotEmpty) {
        Provider.of<Products>(context, listen: false).chooseFlavor =
        product.flavours![0];
        // choosedFalvor = product.flavours![0];
      }
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    isStarted = true;
  }

  @override
  Widget build(BuildContext context) {
    final _lang = Provider.of<LanguageProvider>(context, listen: false);

    final deviceSize = MediaQuery.of(context).size;
    return Directionality(
      textDirection: Provider.of<LanguageProvider>(context).isEnglish
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
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
                    tag: product.productID!,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        product.imageUrl!,
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
                          product: product,
                          // choosedSize: choosedSize,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.description,
                            style: AppStyles.styleSnasR,
                          ),
                        ),
                        customDivider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (product.flavours!.isNotEmpty)
                              Text(_lang.getText('Flavour:').toString()),
                            if (product.sizes!.isNotEmpty)
                              Text(_lang.getText('Size:').toString()),
                          ],
                        ),
                        if (product.flavours!.isNotEmpty ||
                            product.sizes!.isNotEmpty)
                          ProductSizeFlavour(
                            // choosedSize: choosedSize,
                            // choosedFlavor: choosedFalvor,
                            product: product,
                          ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                          thickness: 1,
                        ),
                        CommentButton(
                          product: product,
                        )
                      ],
                    ),
                  )
                ]))
          ],
        ),
        persistentFooterButtons: [
          AddCartButtonDetails(
            product: product,
            // choosedFlavor: choosedFalvor,
            // choosedSize: choosedSize,
          )
        ],
      ),
    );
  }
}