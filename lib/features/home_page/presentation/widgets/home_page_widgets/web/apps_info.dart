import 'package:flutter/material.dart';
import 'package:my_porfolio/global/shared_widgets/list_tile.dart';

class AppsInfo extends StatelessWidget {
  const AppsInfo({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      textData: title,
      subTitle: subTitle,
      fontSize: 5,
    );
  }
}
