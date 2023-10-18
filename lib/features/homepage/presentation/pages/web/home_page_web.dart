import 'package:flutter/material.dart';

import '../../../../../global/utils/constants.dart';

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
              height: 8 * AppConstants.unitHeightValue(context),
            ),
            // Container(
            //   width: double.infinity,
            //   // height: AppConstants.unitHeightValue(context) * 50,
            //   color: const Color.fromARGB(255, 243, 239, 239),
            //   child: CustomPaint(
            //     painter: TopCurvePainter(),
            //   ),
            // ),
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
