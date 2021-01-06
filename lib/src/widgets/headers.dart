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
    final paint = Paint()
      // some properties
      ..color = Color(0xff615AAB)
      // PaintingStyle.stroke --> draw only the borders
      // PaintingStyle.fill --> draw the whole figure
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    // variable that says how the Paint is going to be moved
    final path = Path()
      // draw with Path and Paint (moveTo and lineTo)
      ..moveTo(0, size.height * 0.35)
      ..lineTo(size.width, size.height * 0.30)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    // draw in canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DiamondHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _DiamondHeaderPainter(),
      ),
    );
  }
}

class _DiamondHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      // setting properties to the paint
      ..color = Color(0xff615AAB)
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;
    // create path for the canvas
    final path = Path()..lineTo(size.width, size.height)..lineTo(size.width, 0);
    // path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class PeakHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _PeakHeaderPainter(),
      ),
    );
  }
}

class _PeakHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      // setting properties to paint
      ..color = Color(0xff615AAB)
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;
    // create path for thte canvas
    final path = Path()
      ..lineTo(0, size.height * 0.30)
      ..lineTo(size.width * 0.5, size.height * 0.35) // peak
      ..lineTo(size.width, size.height * 0.30)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CurveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _CurveHeaderPainter(),
      ),
    );
  }
}

class _CurveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      // setting properties to paint
      ..color = Color(0xff615AAB)
      ..strokeWidth = 20.0
      ..style = PaintingStyle.fill;
    // create path for thte canvas
    final path = Path()
      ..lineTo(0, size.height * 0.25)
      // first two values are the curvature angle
      // and last values are the final point of the curve
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.50,
        size.width,
        size.height * 0.25,
      )
      ..lineTo(size.width, 0);

    // path.lineTo(size.width, size.height * 0.25);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class WaveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _WaveHeaderPainter(),
      ),
    );
  }
}

class _WaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      // set properties for paint
      ..color = Color(0xff615AAB)
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
    // create path
    final path = Path()
      ..lineTo(0, size.height * 0.30)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.35,
        size.width * 0.5,
        size.height * 0.3,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.25,
        size.width,
        size.height * 0.3,
      )
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class WaveGradientHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _WaveGradientHeaderPainter(),
      ),
    );
  }
}

class _WaveGradientHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
    );

    final rect = Rect.fromCircle(center: Offset(165.0, 55.0), radius: 180);

    final paint = Paint()
      // set properties for paint
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
    // create path
    final path = Path()
      ..lineTo(0, size.height * 0.30)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.35,
        size.width * 0.5,
        size.height * 0.3,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.25,
        size.width,
        size.height * 0.3,
      )
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
