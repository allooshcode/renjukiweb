import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity{

  const ProductModel({required super.productId, required super.productName,
    required super.description, required super.photoPath, });

  factory ProductModel.fromJson(Map<String, dynamic> map){
   return ProductModel(productId: map['productId'],productName: map['productName'],
       photoPath: map['photoPath'],description: map['description']);
  }

}
