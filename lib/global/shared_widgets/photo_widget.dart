import 'package:flutter/material.dart';
import 'package:my_porfolio/global/utils/constants.dart';
import 'package:progressive_image/progressive_image.dart';

class PhotoWidget extends StatelessWidget {
  final String photoPath;
  final VoidCallback? fun;
  const PhotoWidget({super.key, required this.photoPath, this.fun});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
          // height: AppConstants.unitHeightValue(context) * 40,
          // width: AppConstants.unitWidthValu(context) * 25,
          margin: EdgeInsets.all(
            AppConstants.unitHeightValue(context) * 3,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 20),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            child: ProgressiveImage(
              placeholder: AssetImage(photoPath),
              // size: 1.87KB
              thumbnail: const NetworkImage('https://i.imgur.com/7XL923M.jpg'),
              // size: 1.29MB
              image: AssetImage(
                photoPath,
              ),
              height: AppConstants.unitHeightValue(context) * 40,
              width: AppConstants.unitWidthValu(context) * 25,
            ),
          )),
    );
  }
}
