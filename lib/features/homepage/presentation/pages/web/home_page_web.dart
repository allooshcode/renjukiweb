import 'package:flutter/material.dart';
import 'package:renjuki2/features/homepage/presentation/widgets/home_page_widgets/web/carausel_slider.dart';
import 'package:renjuki2/features/homepage/presentation/widgets/home_page_widgets/web/header_info_web_widget.dart';
import 'package:renjuki2/global/animations/tween_animation.dart';
import 'package:renjuki2/global/shared_widgets/bottom_curve_painter.dart';
import 'package:renjuki2/global/utils/constants.dart';

import '../../widgets/home_page_widgets/web/photo_home.dart';

class HomePageWeb extends StatelessWidget {
  const HomePageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 5 * AppConstants.unitHeightValue(context),
            ),
            // Container(
            //   width: double.infinity,
            //   // height: AppConstants.unitHeightValue(context) * 50,
            //   color: const Color.fromARGB(255, 243, 239, 239),
            //   child: CustomPaint(
            //     painter: TopCurvePainter(),
            //   ),
            // ),
            const QarouselSlider(),
            SizedBox(
              width: AppConstants.secondaryText *
                  AppConstants.unitHeightValue(context),
            ),
            SizedBox(
              height: AppConstants.unitHeightValue(context) * 20,
            ),

          ]),
    );
  }
}
