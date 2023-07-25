import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/productspage/domain/entity/product_entity.dart';
import 'package:renjuki2/features/productspage/presentation/bloc/product_events.dart';
import 'package:renjuki2/features/productspage/presentation/bloc/product_state.dart';

import '../../domain/usecases/fetch_products_usecase.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProductsUseCase fetchProductsUseCase;
  final FetchProductDetailsUseCase fetchProductDetailsUseCase;

  ProductBloc(
      {required this.fetchProductsUseCase,
      required this.fetchProductDetailsUseCase})
      : super(ProductLoadedState(products: [
    const ProductEntity(
        productId: 1,
        productName: 'Excavator',
        description: 'Made in Japan',
        photoPath:
        'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com'
            '/o/3.jpeg?alt=media&token=4dbc6af7-405c-496a-9c05-ecf15a745dc0'),
    const ProductEntity(
        productId: 1,
        productName: 'Excavator',
        description: 'Made in Japan',
        photoPath:
        'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com'
            '/o/3.jpeg?alt=media&token=4dbc6af7-405c-496a-9c05-ecf15a745dc0'),
    const ProductEntity(
        productId: 1,
        productName: 'Excavator',
        description: 'Made in Japan',
        photoPath:
        'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com'
            '/o/3.jpeg?alt=media&token=4dbc6af7-405c-496a-9c05-ecf15a745dc0'),
    const ProductEntity(
        productId: 1,
        productName: 'Excavator',
        description: 'Made in Japan',
        photoPath:
        'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com'
            '/o/3.jpeg?alt=media&token=4dbc6af7-405c-496a-9c05-ecf15a745dc0'),
    const ProductEntity(
              productId: 1,
              productName: 'Excavator',
              description: 'Made in Japan',
              photoPath:
                  'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com'
                      '/o/3.jpeg?alt=media&token=4dbc6af7-405c-496a-9c05-ecf15a745dc0'),
    const ProductEntity(
              productId: 1,
              productName: 'Excavator',
              description: 'Made in Japan',
              photoPath:
                  'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com/o/3.jpeg?alt=media&token=4dbc6af7-405c-496a-9c05-ecf15a745dc0')
        ]));
}
