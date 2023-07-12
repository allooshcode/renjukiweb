class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProductsUseCase fetchProductsUseCase;
  final FetchProductDetailsUseCase fetchProductDetailsUseCase;

  ProductBloc(
      {required this.fetchProductsUseCase,
      required this.fetchProductDetailsUseCase})
      : super(ProductInitialState());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProductsEvent) {
      yield ProductLoadingState();

      try {
        final products = await fetchProductsUseCase.execute();
        yield ProductLoadedState(products: products);
      } catch (e) {
        yield ProductErrorState();
      }
    }
  }
}
