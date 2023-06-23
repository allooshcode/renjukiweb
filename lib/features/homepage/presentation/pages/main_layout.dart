import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/features/homepage/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:renjuki2/features/homepage/presentation/pages/home_page.dart';
import 'package:renjuki2/features/homepage/presentation/pages/web/work_page_web.dart';
import 'package:renjuki2/global/animations/fade_animation.dart';
import 'package:renjuki2/global/shared_widgets/custom_button.dart';
import 'package:renjuki2/global/utils/icon_broken.dart';

import '../../../../container_injection.dart';
import '../../../../global/shared_widgets/bottom_curve_painter.dart';
import '../../../../global/shared_widgets/top_curve_painter.dart';
import '../widgets/singin_signup_container.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.homeBloc});
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    final homeKey = GlobalKey();
    final workKey = GlobalKey();

    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('EXCAVATOR.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        // width: double.infinity,
        // height: MediaQuery.of(context).size.height,
      ),
      Scaffold(
// >>>>>>> c8d6a3ae8a816ac74b33b4f7ebd1dd6e1700d0b8
        appBar: AppBar(
          flexibleSpace: Container(
            width: double.infinity,
            // height: AppConstants.unitHeightValue(context) * 50,
            color: const Color.fromARGB(255, 243, 239, 239),
            child: CustomPaint(
              painter: TopCurvePainter(),
            ),
          ),
          actions: [
            SignInSignUp(
              authBloc: sl(),
            ),

            // CustomButton(
            //     fun: () {
            //       Scrollable.ensureVisible(homeKey.currentContext!);
            //     },
            //     title: "Home",
            //     icon: IconBroken.Home),
            // CustomButton(
            //     fun: () {
            //       Scrollable.ensureVisible(workKey.currentContext!);
            //     },
            //     title: "Work",
            //     icon: IconBroken.Work)
          ],
        ),
        body: SingleChildScrollView(
// <<<<<<< HEAD
// =======
//
// >>>>>>> c8d6a3ae8a816ac74b33b4f7ebd1dd6e1700d0b8
          child: Column(children: [
            CustomFadeAnimation(
              widgetToAnimate: HomePage(
                key: homeKey,
                homeBloc: sl(),
              ),
            ),
            // CustomFadeAnimation(
            //   widgetToAnimate: WorkPageWeb(
            //     key: workKey,
            //   ),
            // )
          ]),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          // height: AppConstants.unitHeightValue(context) * 50,
          color: const Color.fromARGB(255, 243, 239, 239),
          child: CustomPaint(
            painter: BottomCurvePainter(),
          ),
        ),
      ),
    ]);
  }
}
