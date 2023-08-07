import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../global/errors/failures.dart';
import '../../data/models/product_model.dart';
import '../entity/product_entity.dart';
import '../repository/product_repository.dart';

class FetchProductsUseCase extends Equatable{
  final ProductRepository repository;

  const FetchProductsUseCase({required this.repository});

  Future<Either<Failure,List<ProductEntity>>> execute() {
    return repository.fetchProducts();
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FetchProductDetailsUseCase {
  final ProductRepository repository;

  FetchProductDetailsUseCase({required this.repository});

  Future<Either<Failure,ProductModel>> execute(int productId) {
    return repository.fetchProductDetails(productId);
  }
}
