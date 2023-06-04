import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomCurvePainter extends CustomPainter {
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

    path.moveTo(0, 0);
    // path.quadraticBezierTo(150, -150, 300, -150);

    //  path.moveTo(600, -300);
    if (kDebugMode) {
      print(size.height.ceil());
    }
    path.quadraticBezierTo(
        size.width / 5, -size.width / 8, size.width / 3, -size.width / 8);
    path.quadraticBezierTo(
        size.width / 1.5, -size.width / 8, size.width, -size.width / 5);

    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
    //     size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
