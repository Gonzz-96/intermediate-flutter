import 'dart:math' as Math;

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  double _percentage = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          _increasePercentage(additionalPercentage: 1);
          if (_percentage > 100) {
            _resetPercentage();
          }
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _RadialProgressPainter(arcPercentage: _percentage),
          ),
        ),
      ),
    );
  }

  void _increasePercentage({int additionalPercentage = 10}) => setState(() {
        _percentage += additionalPercentage;
      });

  void _resetPercentage() => setState(() {
        _percentage = 0;
      });
}

class _RadialProgressPainter extends CustomPainter {
  _RadialProgressPainter({this.arcPercentage = 0});

  double arcPercentage;

  @override
  void paint(Canvas canvas, Size size) {
    // complete circle
    final circlePaint = Paint()
      ..strokeWidth = 4.0
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final centerOffset = Offset(size.width * .5, size.height * 0.5);
    final radius = Math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(centerOffset, radius, circlePaint);

    // arc
    final arcPaint = Paint()
      ..strokeWidth = 10.0
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // filled part
    // final centerOffset = Offset(size.width * .5, size.height * 0.5);
    // final radio = min(size.width * 0.5, size.height * 0.5);
    var arcAngle = 2 * Math.pi * (arcPercentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: centerOffset, radius: radius),
      -Math.pi / 2,
      arcAngle,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
