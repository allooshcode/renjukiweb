import 'package:flutter/material.dart';

import '../../../../../global/utils/constants.dart';
import '../../widgets/home_page_widgets/web/carausel_slider.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // const HeaderInfoWebWidget(),

            SizedBox(
              width: AppConstants.secondaryText *
                  AppConstants.unitHeightValue(context),
            ),
            const QarouselSlider(),
            // const CustomTweenAnimation(widgetToAnimate: PhotoHome()),
            SizedBox(
              height: AppConstants.unitHeightValue(context) * 20,
            ),

          ]),
    );
  }
}
