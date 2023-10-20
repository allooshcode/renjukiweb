import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  static const ID = 'id';
  static const NAME = 'name';
  static const IMAGE = 'image';

  final String? id;
  final String? name;
  final String? image;

  const CategoryEntity({this.id, this.name, this.image});

  @override
  List<Object?> get props => throw UnimplementedError();
}
