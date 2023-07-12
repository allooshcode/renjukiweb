import '../../data/models/product_model.dart';
import '../repository/product_repository.dart';

class FetchProductsUseCase {
  final ProductRepository repository;

  FetchProductsUseCase({required this.repository});

  Future<List<Product>> execute() {
    return repository.fetchProducts();
  }
}

class FetchProductDetailsUseCase {
  final ProductRepository repository;

  FetchProductDetailsUseCase({required this.repository});

  Future<Product> execute(int productId) {
    return repository.fetchProductDetails(productId);
  }
}
