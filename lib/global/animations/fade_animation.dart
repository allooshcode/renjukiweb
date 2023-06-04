import 'package:flutter/material.dart';

class CustomFadeAnimation extends StatefulWidget {
  const CustomFadeAnimation({super.key, required this.widgetToAnimate});
  final Widget widgetToAnimate;

  @override
  State<CustomFadeAnimation> createState() => _CustomFadeAnimationState();
}

class _CustomFadeAnimationState extends State<CustomFadeAnimation>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn);

    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: FadeTransition(
        opacity: animation,
        child: widget.widgetToAnimate,
      ),
    );
  }
}
