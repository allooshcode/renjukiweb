import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:renjuki2/features/categories/web/domain/entities/category_entity.dart';
import 'package:renjuki2/features/categories/web/presentation/widgets/catigory_widget.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.categoriesList});

  final List<CategoryEntity> categoriesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, i) {
            return Padding(
                padding: EdgeInsetsDirectional.only(
                    start: MediaQuery.of(context).size.width * 0.05));
          },
          itemBuilder: (context, i) => CategoryWidgetWeb(
                categoryEntity: categoriesList[i],
              ),
          itemCount: categoriesList.length),
    );
  }
}
