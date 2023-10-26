import 'package:flutter/widgets.dart';
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
      : super(ProductInitialState()) {
    on<FetchProductsEvent>((event, emit) async {
      emit(ProductLoadingState());

      final response = await fetchProductsUseCase.execute();
      response.fold((l) => emit(ProductErrorState(l.msgError)), (r) {
        debugPrint(r.first.description);
        emit(ProductLoadedState(products: r));
      });
    });
  }
}
