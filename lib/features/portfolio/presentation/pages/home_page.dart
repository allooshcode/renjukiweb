import 'package:flutter/material.dart';
import 'package:renjuki2/features/portfolio/presentation/pages/mobile/home_page_mobile.dart';
import 'package:renjuki2/features/portfolio/presentation/pages/web/home_page_web.dart';
import 'package:renjuki2/global/shared_widgets/responser_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponserWidget(
      //here added web for both platform.
      mobileWidget: HomePageMobile(),
      webWidget: HomePageWeb(),
    );
  }
}
