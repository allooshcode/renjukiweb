// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static const TextStyle textStyle1 = TextStyle(
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    fontFamily: 'mmoom',
  );

  static InputBorder outLinedBorder = const OutlineInputBorder(
    borderSide: BorderSide(width: 1),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  );

  static TextStyle getStyleOpen(BuildContext context,
      {double size = 16, Color color = Colors.deepPurple}) {
    return GoogleFonts.saira(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static final styleOpen = GoogleFonts.oswald(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  // );TextStyle(
  //   fontSize: 24,
  //   color: Colors.black,
  //   fontWeight: FontWeight.bold,
  //   fontFamily: 'mmoom',
  // );

  static final styleSnasR = GoogleFonts.montserrat(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static final googleStyle = GoogleFonts.abel(
    fontSize: 24,
    color: Colors.blueAccent,
  );
}
