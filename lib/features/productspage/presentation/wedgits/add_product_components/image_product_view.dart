import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';
import 'package:suriashop/models/product.dart';

class ImageProductView extends StatelessWidget {
  const ImageProductView({Key? key, required this.image, required this.product})
      : super(key: key);

  final File? image;
  final ProductEntity? product;

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return Container(
      height: _media.height * 0.2,
      width: _media.width * 0.3,
      decoration: BoxDecoration(border: Border.all()),
      child: (defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS ||
              !kIsWeb)
          ? image == null
              ? const Text('no image')
              : product != null
                  ? Image.network(product!.imageUrl)
                  : Image.file(image!)
          : Provider.of<Products>(context).imageUrl != null
              ? product == null
                  ? Image.network(
                      Provider.of<Products>(context, listen: false).imageUrl!,
                    )
                  : Image.network(product!.imageUrl!)
              : const Text('no image'),
    );
  }
}
