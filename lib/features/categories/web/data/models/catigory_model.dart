import 'package:renjuki2/features/categories/web/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  static const ID = 'id';
  static const NAME = 'name';
  static const IMAGE = 'image';
  const CategoryModel(
      {required super.id, required super.name, required super.image});

  factory CategoryModel.fromSnapshot(Map<String, dynamic> snapshot) {
    // this.id = snapshot.id;
    return CategoryModel(
        id: snapshot[ID], name: snapshot[NAME], image: snapshot[IMAGE]);
  }
}
