import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:renjuki2/features/categories/web/domain/entities/category_entity.dart';

import '../../../../../global/errors/failures.dart';

abstract class CategoryDomainRepsitory extends Equatable {
  Future<Either<Failure, List<CategoryEntity>>> fetch();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
