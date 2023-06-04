import 'package:flutter/material.dart';
import 'package:my_porfolio/global/utils/constants.dart';
import 'package:progressive_image/progressive_image.dart';

class PhotoHome extends StatelessWidget {
  const PhotoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppConstants.unitHeightValue(context) * AppConstants.photoHigh,
        width: AppConstants.unitWidthValu(context) * AppConstants.photoWidth,
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
          child: ClipPath(
            clipper: ClipPathClass(),
            child: ProgressiveImage(
              placeholder: const AssetImage('assets/alaa.jpg'),
              // size: 1.87KB
              thumbnail: const NetworkImage('https://i.imgur.com/7XL923M.jpg'),
              // size: 1.29MB
              image: const AssetImage(
                'assets/alaa.jpg',
              ),
              height: AppConstants.unitHeightValue(context) *
                  AppConstants.photoHigh,
              width:
                  AppConstants.unitWidthValu(context) * AppConstants.photoWidth,
            ),
          ),
        ));
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
