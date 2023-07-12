import 'package:your_project_name/domain/product_repository.dart';
import 'package:your_project_name/models/product.dart';

import '../../domain/repository/product_repository.dart';
import '../models/product_model.dart';

class ProductDataRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      Product(id: 1, name: 'Product 1', description: 'Description 1'),
      Product(id: 2, name: 'Product 2', description: 'Description 2'),
      Product(id: 3, name: 'Product 3', description: 'Description 3'),
    ];
  }

  @override
  Future<Product> fetchProductDetails(int productId) async {
    final products = await fetchProducts();
    final product = products.firstWhere((p) => p.id == productId);
    return product;
  }
}
