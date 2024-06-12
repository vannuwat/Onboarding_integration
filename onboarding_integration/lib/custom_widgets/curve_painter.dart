import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  final double height;
  final Color color;

  const CurvePainter({    
    required this.height,
    required this.color
  });
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * height);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // Draw the shadow
    canvas.drawShadow(path, Colors.black, 3.0, false);

    // Draw the shape
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


