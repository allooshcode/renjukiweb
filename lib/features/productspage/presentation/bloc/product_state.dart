import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';


abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductEntity> products;

  ProductLoadedState({required this.products});
}

class ProductErrorState extends ProductState {}
