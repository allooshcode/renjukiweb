import 'package:flutter/material.dart';

import '../../../../../global/animations/tween_animation.dart';
import '../../../../../global/shared_widgets/bottom_curve_painter.dart';
import '../../../../../global/utils/constants.dart';
import '../../widgets/home_page_widgets/web/header_info_web_widget.dart';
import '../../widgets/home_page_widgets/web/photo_home.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const HeaderInfoWebWidget(),
            SizedBox(
              width: AppConstants.secondaryText *
                  AppConstants.unitHeightValue(context),
            ),
            const CustomTweenAnimation(widgetToAnimate: PhotoHome()),
            SizedBox(
              height: AppConstants.unitHeightValue(context) * 20,
            ),
            Container(
              width: double.infinity,
              // height: AppConstants.unitHeightValue(context) * 50,
              color: const Color.fromARGB(255, 243, 239, 239),
              child: CustomPaint(
                painter: BottomCurvePainter(),
              ),
            ),
          ]),
    );
  }
}
