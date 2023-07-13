import 'package:dartz/dartz.dart';


import '../../../../global/errors/failures.dart';
import '../../domain/repository/product_repository.dart';
import '../models/product_model.dart';

class ProductDataRepository implements ProductRepository {
  @override
  Future<Either<Failure,List<ProductModel>>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return right([
       const ProductModel(productId: 3, productName: 'Product 3', description: 'Description 3',photoPath: ''),
    ]);}

  @override
  Future<Either<Failure, ProductModel>> fetchProductDetails(int productId) {
    // TODO: implement fetchProductDetails
    throw UnimplementedError();
  }

  }



