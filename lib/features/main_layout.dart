import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:renjuki2/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:renjuki2/features/homepage/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:renjuki2/features/homepage/presentation/pages/about_us_page.dart';
import 'package:renjuki2/features/homepage/presentation/pages/app_drawer.dart';
import 'package:renjuki2/features/homepage/presentation/pages/home_page.dart';
import 'package:renjuki2/features/homepage/presentation/pages/mobile/about_us_page_mobile.dart';
import 'package:renjuki2/features/homepage/presentation/pages/web/work_page_web.dart';
import 'package:renjuki2/global/animations/fade_animation.dart';
import 'package:renjuki2/global/shared_widgets/custom_button.dart';
import 'package:renjuki2/global/shared_widgets/responser_widget.dart';
import 'package:renjuki2/global/utils/constants.dart';
import 'package:renjuki2/global/utils/icon_broken.dart';

import '../container_injection.dart';
import '../global/shared_widgets/bottom_curve_painter.dart';
import '../global/shared_widgets/top_curve_painter.dart';
import 'homepage/presentation/widgets/home_page_widgets/web/carausel_slider.dart';
import 'homepage/presentation/widgets/home_page_widgets/web/footer_info.dart';
import 'homepage/presentation/widgets/singin_signup_container.dart';

class MainLayout extends StatelessWidget {
  MainLayout({
    super.key,
  });

  // final ScrollController _scrollController = ScrollController();
  bool showCurve = true;
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    debugPrint(showCurve.toString());

    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('EXCAVATOR.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        // width: double.infinity,
        // height: MediaQuery.of(context).size.height,
      ),
      Scaffold(
          drawer: const DrawerApp(),
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
              const SignInSignUp(
                  // homeBloc: sl(),
                  ),
              CustomButton(
                  fun: () {
                    Scrollable.ensureVisible(homeKey.currentContext!);
                  },
                  title: "Home",
                  icon: IconBroken.Home),
              CustomButton(
                  fun: () {
                    Scrollable.ensureVisible(aboutKey.currentContext!);
                  },
                  title: "about",
                  icon: IconBroken.Work)
            ],
          ),
          body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              final metrics = scrollNotification.metrics;
              if (metrics.atEdge) {
                bool isTop = metrics.pixels == 0;
                if (isTop) {
                  context.read<HomeBloc>().add(HomepageCurveOnEvent());

                  showCurve = true;
                } else {
                  context.read<HomeBloc>().add(HomepageCurveOffEvent());
                }
              }
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // CustomFadeAnimation(
                    //   widgetToAnimate: HomePage(
                    //     key: homeKey,
                    //     homeBloc: sl(),
                    //   ),
                    // ),
                    SizedBox(
                      height: AppConstants.unitHeightValue(context) * 10,
                    ),
                    CustomFadeAnimation(
                        widgetToAnimate: QarouselSlider(
                      key: homeKey,
                    )),
                    SizedBox(
                      height: AppConstants.unitHeightValue(context) * 10,
                    ),
                    CustomFadeAnimation(
                      widgetToAnimate: ResponserWidget(
                        webWidget: AboutUsPage(
                          key: aboutKey,
                        ),
                        mobileWidget: AboutUsPageMobile(
                          key: aboutKey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.unitHeightValue(context) * 20,
                    ),
                    const Stack(children: [BottomFooterInfo()]),
                  ]),
            ),
          ),
          bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              switch (state) {
                case HomepageCurveOff():
                  return const SizedBox();
                case HomePageCurveOn():
                  return CustomFadeAnimation(
                    widgetToAnimate: Container(
                      width: double.infinity,
                      // height: AppConstants.unitHeightValue(context) * 50,
                      color: const Color.fromARGB(255, 243, 239, 239),
                      child: CustomPaint(
                        painter: BottomCurvePainter(),
                      ),
                    ),
                  );
                default:
                  return CustomFadeAnimation(
                    widgetToAnimate: Container(
                      width: double.infinity,
                      // height: AppConstants.unitHeightValue(context) * 50,
                      color: const Color.fromARGB(255, 243, 239, 239),
                      child: CustomPaint(
                        painter: BottomCurvePainter(),
                      ),
                    ),
                  );
              }
            },
          )),
    ]);
  }
}
