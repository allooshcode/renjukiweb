import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.productName,
      required super.description,
      required super.price,
      required super.category,
      required super.availableCount,
      required super.weight,
      required imageUrl});

  factory ProductModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return ProductModel(
        productName: snapshot[NAME],
        description: snapshot[DESCRIPTION],
        price: num.parse(snapshot[PRICE]),
        category: snapshot[CATEGORY],
        availableCount: num.parse(snapshot[AVAILABLECOUNT]),
        weight: double.parse(snapshot[WEIGHT]),
        imageUrl: snapshot[IMAGEURL]);
  }
  // factory ProductModel.fromJson(Map<String, dynamic> map) {
  //   return ProductModel(
  //       productId: map['productId'],
  //       productName: map['productName'],
  //       photoPath: map['photoPath'],
  //       description: map['description']);
  // }

  static const ID = 'productID';
  static const NAME = 'name';
  static const DESCRIPTION = 'description';
  static const AVAILABLECOUNT = 'available';
  static const PRICE = 'price';
  static const SALE = 'sale';
  static const FEATURED = 'featured';
  static const FAVORITE = 'favorite';
  static const CATEGORY = 'category';
  static const IMAGEURL = 'imageurl';
  static const Flavour = 'flavours';
  static const SIZES = 'sizes';
  static const OFFER = 'offer';
  static const SOLD = 'sold';
  static const WEIGHT = 'weight';
}
