import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:renjuki2/container_injection.dart';
import 'package:renjuki2/features/productspage/data/models/product_model.dart';
import 'package:renjuki2/global/errors/failures.dart';
import 'package:renjuki2/global/services/network_services.dart';

class ProductDataRemoteSource extends Equatable {
  final FirebaseFireService fireService = sl<FirebaseFireService>();

  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response =
          await fireService.firebaseFire.collection('Products').get();

      return right(<ProductModel>[]);
    } on FirebaseException catch (err) {
      return left(ServerFuilure(err.toString()));
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
