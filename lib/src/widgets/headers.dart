import 'package:flutter/material.dart';

class SquaredHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Color(0xff615AAB),
    );
  }
}

class CircularBorderHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        color: Color(0xff615AAB),
      ),
      height: 300.0,
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _DiagonalHeaderPainter(),
      ),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // some properties
    paint.color = Color(0xff615AAB);
    // PaintingStyle.stroke --> draw only the borders
    // PaintingStyle.fill --> draw the whole figure
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    // variable that says how the Paint is going to be moved
    final path = Path();

    // draw with Path and Paint (moveTo and lineTo)
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // draw in canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
