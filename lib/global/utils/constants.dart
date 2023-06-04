import 'package:flutter/material.dart';

class AppConstants {
  static double unitHeightValue(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.01;
  }

  static double unitWidthValu(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.01;
  }

  static const double headerText = 6;
  static const double secondaryText = 3;

  static const double photoHigh = 65;
  static const double photoWidth = 30;

  static const String mobileGooglePlayApp =
      'https://play.google.com/store/apps/details?id=com.suriawholesaler.suriashop';

  static const String webAppLink = 'https://suriawholesaler.com/';
    static const String iosAppLink = 'https://apps.apple.com/tt/app/suria-store/id1606872385?uo=2';

  static const String linkidInUrl =
      'https://www.linkedin.com/in/alaa-ahmad-39074a108/';

  static const String resumeUrl =
      'https://drive.google.com/file/d/1dJVaFXCab5T3pZrvp7qM3esx128tfWZW/view?usp=sharing';
}
