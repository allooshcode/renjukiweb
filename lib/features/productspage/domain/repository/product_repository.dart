import 'package:your_project_name/models/product.dart';

import '../../data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
  Future<Product> fetchProductDetails(int productId);
}
