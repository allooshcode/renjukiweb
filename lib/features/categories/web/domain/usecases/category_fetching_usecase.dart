import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:renjuki2/features/categories/web/domain/entities/category_entity.dart';
import 'package:renjuki2/features/categories/web/domain/repository/category_domain_repository.dart';

import '../../../../../global/errors/failures.dart';

class CategoryFetchingUsecase extends Equatable {
  final CategoryDomainRepsitory categoryFetchRepsitory;

  const CategoryFetchingUsecase({required this.categoryFetchRepsitory});

  Future<Either<Failure, List<CategoryEntity>>> fetch() {
    return categoryFetchRepsitory.fetch();
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
