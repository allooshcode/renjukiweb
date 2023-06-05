import 'package:flutter/material.dart';

import 'package:renjuki/features/home_page/presentation/pages/web/home_page_web.dart';

import '../../../../global/shared_widgets/responser_widget.dart';
import 'mobile/home_page_mobile.dart';

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
