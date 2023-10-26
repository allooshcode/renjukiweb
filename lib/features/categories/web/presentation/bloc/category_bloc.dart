import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:renjuki2/features/categories/web/domain/entities/category_entity.dart';
import 'package:renjuki2/features/categories/web/domain/usecases/category_fetching_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryFetchingUsecase categoryFetchingUsecase;

  CategoryBloc(this.categoryFetchingUsecase) : super(CategoryInitial()) {
    on<CategoryEventFetch>((event, emit) async {
      emit(CategoryLoading());
      final response = await categoryFetchingUsecase.fetch();
      response.fold((l) {
        emit(CategoryLoading());
      }, (r) {
        emit(CategoryLoaded(categoryList: r));
      });
    });
  }
}
