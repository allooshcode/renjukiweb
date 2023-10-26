import 'package:dartz/dartz.dart';
import 'package:renjuki2/features/productspage/data/data_sources/remote_data/product_data_remote_source.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';

import '../../../../global/errors/failures.dart';
import '../../domain/repository/product_repository.dart';
import '../models/product_model.dart';

class ProductDataRepository implements ProductRepository {
  final ProductDataRemoteSource productDataRemoteSource;

  ProductDataRepository({required this.productDataRemoteSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    return productDataRemoteSource.getProducts();
  }

  @override
  Future<Either<Failure, ProductModel>> fetchProductDetails(int productId) {
    // TODO: implement fetchProductDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> createProduct() async {
    return right(true);
  }
}
