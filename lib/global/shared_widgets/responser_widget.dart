import 'package:flutter/material.dart';

class ResponserWidget extends StatelessWidget {
  const ResponserWidget(
      {super.key, required this.mobileWidget, required this.webWidget});

  final Widget mobileWidget;
  final Widget webWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 580) return mobileWidget;
        return webWidget;
      },
    );
  }
}
