import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{


   final int productId;
   final String productName;
  final String description;
  final String photoPath;

  const ProductEntity({required this.productId,required this.productName,required this.description,required this.photoPath});




  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();




}