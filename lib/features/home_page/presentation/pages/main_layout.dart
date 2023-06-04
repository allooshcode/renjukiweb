import 'package:flutter/material.dart';

import 'package:my_porfolio/features/portfolio/presentation/pages/home_page.dart';
import 'package:my_porfolio/features/portfolio/presentation/pages/web/work_page_web.dart';
import 'package:my_porfolio/global/animations/fade_animation.dart';
import 'package:my_porfolio/global/shared_widgets/custom_button.dart';
import 'package:my_porfolio/global/utils/icon_broken.dart';

import '../../../../global/shared_widgets/top_curve_painter.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final homeKey = GlobalKey();
    final workKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace:  Container(
              width: double.infinity,
              // height: AppConstants.unitHeightValue(context) * 50,
              color: const Color.fromARGB(255, 243, 239, 239),
              child: CustomPaint(
                painter: TopCurvePainter(),
              ),
            ) ,
        actions: [
        CustomButton(
            fun: () {
              Scrollable.ensureVisible(homeKey.currentContext!);
            },
            title: "Home",
            icon: IconBroken.Home),
        
        
        CustomButton(
            fun: () {
              Scrollable.ensureVisible(workKey.currentContext!);
            },
            title: "Work",
            icon: IconBroken.Work)
      ],
    ),
      body: SingleChildScrollView(
        child: Column(children: [
          CustomFadeAnimation(
            widgetToAnimate: HomePage(
              key: homeKey,
            ),
          ),
          CustomFadeAnimation(
            widgetToAnimate: WorkPageWeb(
              key: workKey,
            ),
          )
        ]),
      ),
    );
  }
}
