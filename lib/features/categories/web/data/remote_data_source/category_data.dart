import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:renjuki2/features/categories/web/data/models/catigory_model.dart';
import 'package:renjuki2/global/errors/failures.dart';
import 'package:renjuki2/global/services/network_services.dart';

class CategoryData implements Equatable {
  final FirebaseFireService fireStore;
  CategoryData({required this.fireStore});

  Future<Either<Failure, List<CategoryModel>>> categoryDataFetch() async {
    List<CategoryModel> categoriesList = [];
    try {
      final categories =
          await FirebaseFirestore.instance.collection('Categories').get();
      // await fireStore.firebaseFire.collection('Categories').get();
      for (var element in categories.docs) {
        categoriesList.add(CategoryModel.fromSnapshot(element.data()));
      }
      return right(categoriesList);
    } on FirebaseException catch (err) {
      return left(ServerFuilure(err.toString()));
    }
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}
