import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renjuki2/features/productspage/presentation/bloc/product_events.dart';
import 'package:renjuki2/features/productspage/presentation/bloc/product_state.dart';

import '../../domain/usecases/fetch_products_usecase.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProductsUseCase fetchProductsUseCase;
  final FetchProductDetailsUseCase fetchProductDetailsUseCase;

  ProductBloc(
      {required this.fetchProductsUseCase,
      required this.fetchProductDetailsUseCase})
      : super(ProductInitialState());


}
