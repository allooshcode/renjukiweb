import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  const TextItem(
      {Key? key,
      required this.text,
      this.fontSize = 18,
      this.color = Colors.black})
      : super(key: key);

  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, fontFamily: 'Quicksand-Regular', color: color),
    );
  }
}
