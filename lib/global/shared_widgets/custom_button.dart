import 'package:flutter/material.dart';
import 'package:my_porfolio/global/app_colors/app_colors_dark.dart';
import 'package:my_porfolio/global/utils/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.fun, required this.title, required this.icon});

  final VoidCallback fun;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.unitWidthValu(context) * 15,
      height: AppConstants.unitHeightValue(context) * 4,
      margin: EdgeInsets.only(
          top: AppConstants.unitHeightValue(context) * 2,
          left: AppConstants.unitWidthValu(context) * 2,
          right: AppConstants.unitWidthValu(context) * 2,
          bottom: AppConstants.unitHeightValue(context) * 2),
      child: ElevatedButton.icon(
        icon: Align(
            alignment: Alignment.topCenter,
            child: Icon(
              icon,
            )),
        label: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style:
                TextStyle(fontSize: AppConstants.unitWidthValu(context) * 1.2),
          ),
        ),
        onPressed: () => fun(),
        style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(AppColorsLight.primaryColor),
            backgroundColor: MaterialStateProperty.all<Color>(
                AppColorsLight.secondaryColor)),
      ),
    );
  }
}
