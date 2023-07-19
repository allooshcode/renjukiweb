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

  static const String faceBookLink =
      'https://www.facebook.com/people/REN-JUKI-2009/100092640443114/';
  static const String iosAppLink =
      'https://apps.apple.com/tt/app/suria-store/id1606872385?uo=2';

  static const String linkidInUrl =
      'https://www.linkedin.com/in/alaa-ahmad-39074a108/';

  static const String resumeUrl =
      'https://drive.google.com/file/d/1dJVaFXCab5T3pZrvp7qM3esx128tfWZW/view?usp=sharing';

  static const String photo1 =
      'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com/o/1.jpeg?alt=media&token=b18feed0-5542-45c5-bcdf-03c1a74c52a4';

  static const String photo2 =
      'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com/o/3.jpeg?alt=media&token=4dbc6af7-405c-496a-9c05-ecf15a745dc0';

  static const String photo3 =
      'https://firebasestorage.googleapis.com/v0/b/renjuki.appspot.com/o/4.jpeg?alt=media&token=b06245fa-f91c-4c5c-b1da-99b09f0f958f';
}
