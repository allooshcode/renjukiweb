

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:renjuki2/features/productspage/domain/repository/product_repository.dart';

import '../../../../global/errors/failures.dart';

class NewProductUseCase extends Equatable{

  final ProductRepository productRepository;

  const NewProductUseCase({required this.productRepository});

  Future<Either<Failure,bool>> execute(){
    return productRepository.createProduct();
  }


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();




}