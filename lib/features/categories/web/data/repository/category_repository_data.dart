import 'package:dartz/dartz.dart';
import 'package:renjuki2/features/categories/web/data/remote_data_source/category_data.dart';

import 'package:renjuki2/features/categories/web/domain/entities/category_entity.dart';

import 'package:renjuki2/global/errors/failures.dart';

import '../../domain/repository/category_domain_repository.dart';

class CategoryRepositoryData implements CategoryDomainRepsitory {
  final CategoryData categoryData;

  CategoryRepositoryData({required this.categoryData});

  @override
  Future<Either<Failure, List<CategoryEntity>>> fetch() {
    return categoryData.categoryDataFetch();
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
