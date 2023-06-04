import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TopCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint()
    //   ..color = Colors.yellow
    //   ..strokeWidth = 20.0;

    // var path = Path()
    //   ..moveTo(0, 0)
    //   ..lineTo(0, 100)
    //   ..lineTo(100, 100)
    //   ..lineTo(100, 0);

    // canvas.drawPath(path, paint);
    var paint = Paint();
    paint.color = const Color.fromARGB(255, 255, 255, 255);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(size.width / 3, 0);
    // path.quadraticBezierTo(150, -150, 300, -150);

    //  path.moveTo(600, -300);
    if (kDebugMode) {
      print(size.height.ceil());
    }
    path.quadraticBezierTo(
        size.width / 3, size.width / 11, size.width / 6, size.width / 12);
    path.quadraticBezierTo(
        size.width / 10, size.width / 13, 0, size.width / 11);
    // path.quadraticBezierTo(
    //     size.width / 4, size.width / 3, size.width/3, size.width / 3);

    path.lineTo(0, 0);
    path.lineTo(size.width / 3, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
