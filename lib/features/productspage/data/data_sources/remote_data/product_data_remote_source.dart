import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:renjuki2/container_injection.dart';
import 'package:renjuki2/features/productspage/data/models/product_model.dart';
import 'package:renjuki2/global/errors/failures.dart';
import 'package:renjuki2/global/services/network_services.dart';
import 'package:uuid/uuid.dart';

class ProductDataRemoteSource extends Equatable {
  final FirebaseFireService fireService = sl<FirebaseFireService>();
   final List<ProductModel> _productLists = [];
  final List<ProductModel> _soldProducts = [];
  bool allLatest = false;
  bool allSold = false;
  String? imageUrl;
  Uuid uuid = const Uuid();
  String chooseSize = '';
  String chooseFlavor = '';

  // final String? userIDThis;
  // Products(this._productLists, this.userIDThis);

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
            final ref = FirebaseStorage.instance
                .ref()
                .child('productImages')
                .child('${product.productName}.jpg');

            await ref.putFile(imageFile);
            imageUrl = await ref.getDownloadURL();
          }
        }
      }

      product.imageUrl = imageUrl!;
      if (itemUpdated) {
        await fireService.firebaseFire.collection('Products').doc(product.productID).update(
          {
            ProductModel.ID: product.productID,
            ProductModel.NAME: product.productName,
            ProductModel.DESCRIPTION: product.description,
            ProductModel.PRICE: product.price,
            ProductModel.IMAGEURL: imageUrl,
            ProductModel.CATEGORY: product.category,
            ProductModel.AVAILABLECOUNT: product.availableCount,
            ProductModel.SALE: product.sale,
            ProductModel.FEATURED: product.featured,
            ProductModel.FAVORITE: product.favorite,
            ProductModel.Flavour: product.flavours,
            ProductModel.SIZES: product.sizes,
            ProductModel.SOLD: product.sold,
            ProductModel.OFFER: product.offer,
            ProductModel.WEIGHT: product.weight.toString()
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
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  }





  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
