import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:renjuki2/container_injection.dart';
import 'package:renjuki2/features/productspage/data/models/product_model.dart';
import 'package:renjuki2/global/errors/failures.dart';
import 'package:renjuki2/global/services/network_services.dart';

class ProductDataRemoteSource extends Equatable {
  final FirebaseFireService fireService = sl<FirebaseFireService>();

  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response =
          await fireService.firebaseFire.collection('Products').get();
      print('data prodects .........');

      final productsList = <ProductModel>[];
      for (var element in response.docs) {
        print(element.data());
        productsList.add(ProductModel.fromSnapshot(element.data()));
      }

      return right(productsList);
    } on FirebaseException catch (err) {
      return left(ServerFuilure(err.toString()));
    }
  }

  Future<Either<Failure, bool>> createProduct(ProductModel product, File? imageFile, bool imageChanged,
      bool itemUpdated, bool isBrowser) async{
    try {
      if (imageFile != null) {
        if (imageChanged) {
          if (!isBrowser) {
            final ref = firebase_storage.FirebaseStorage.instance
                .ref()
                .child('productImages')
                .child('${product.productName}.jpg');

            await ref.putFile(imageFile);
            imageUrl = await ref.getDownloadURL();
          }
        }
      }

      product.imageUrl = imageUrl;
      if (itemUpdated) {
        await fireStore.collection('Products').doc(product.productID).update(
          {
            Product.ID: product.productID,
            Product.NAME: product.productName,
            Product.DESCRIPTION: product.description,
            Product.PRICE: product.price,
            Product.IMAGEURL: imageUrl,
            Product.CATEGORY: product.category,
            Product.AVAILABLECOUNT: product.availableCount,
            Product.SALE: product.sale,
            Product.FEATURED: product.featured,
            Product.FAVORITE: product.favorite,
            Product.Flavour: product.flavours,
            Product.SIZES: product.sizes,
            Product.SOLD: product.sold,
            Product.OFFER: product.offer,
            Product.WEIGHT: product.weight.toString()
          },
        ).then((value) => imageUrl = null);
      } else {
        final id = uuid.v1();
        await fireStore.collection('Products').doc(id).set({
          Product.ID: id,
          Product.NAME: product.productName,
          Product.DESCRIPTION: product.description,
          Product.PRICE: product.price,
          Product.IMAGEURL: imageUrl,
          Product.CATEGORY: product.category,
          Product.AVAILABLECOUNT: product.availableCount,
          Product.SALE: product.sale,
          Product.OFFER: product.offer,
          Product.FEATURED: product.featured,
          Product.FAVORITE: product.favorite,
          Product.Flavour: product.flavours,
          Product.SIZES: product.sizes,
          Product.SOLD: product.sold,
          Product.WEIGHT: product.weight.toString()
        }).then((value) => imageUrl = null);
      }
      notifyListeners();
      //final url
    } on FirebaseException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }
  }





  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
