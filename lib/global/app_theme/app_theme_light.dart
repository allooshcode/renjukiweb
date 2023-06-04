import 'package:flutter/material.dart';
import 'package:my_porfolio/global/app_colors/app_colors_dark.dart';

ThemeData getAppThemeDataLight() {
  return ThemeData(
      // scaffoldBackgroundColor: Colors.blue[400],
      scaffoldBackgroundColor: const Color(0xFF26a0d3),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(
            0xFF26a0d3,
          )),
      textTheme: const TextTheme(
          bodySmall: TextStyle(
              color: Color.fromARGB(255, 15, 16, 1),
              fontWeight: FontWeight.bold,
              fontSize: 13),
          bodyLarge: TextStyle(
            color: Color.fromARGB(255, 242, 241, 247),
          )),
      iconTheme: const IconThemeData(color: AppColorsLight.primaryColor),
      primaryIconTheme:
          const IconThemeData(color: Color.fromARGB(255, 14, 14, 11)),
      listTileTheme: const ListTileThemeData(
        iconColor: Color.fromARGB(255, 13, 13, 8),
      ));
  //primaryIconTheme: const IconThemeData(color: Colors.red));
}
