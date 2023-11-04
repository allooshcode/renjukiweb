import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  String? productID;
  late String productName;
  late String description;
  late num availableCount;
  late int sold;
  late num price;
  List<String>? flavours = [];
  bool sale = false;
  bool featured = false;
  bool favorite = false;
  late String category;
  late String imageUrl;
  // List<String> sizes;
  Map<String, String>? sizes = {};
  num offer = 0;
  int quantity = 1;
  num weight = 1;

  ProductEntity({
    this.productID,
    required this.productName,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    this.sold = 0,
    this.favorite = false,
    this.featured = false,
    this.sale = false,
    this.flavours,
    this.sizes,
    required this.availableCount,
    this.offer = 0,
    required this.weight,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
