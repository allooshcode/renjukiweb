import 'package:dartz/dartz.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';
import 'package:renjuki2/global/errors/failures.dart';

import '../../data/models/product_model.dart';

abstract class ProductRepository {

  Future<Either<Failure,List<ProductEntity>>> fetchProducts();
  Future<Either<Failure,ProductModel>> fetchProductDetails(int productId);
  Future<Either<Failure,bool>> createProduct();
}
