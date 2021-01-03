import 'dart:math' as Math;

import 'package:flutter/material.dart';

class RadialProgressIndicator extends StatefulWidget {
  RadialProgressIndicator({@required this.percentage});

  final double percentage;

  @override
  _RadialProgressIndicatorState createState() =>
      _RadialProgressIndicatorState();
}

class _RadialProgressIndicatorState extends State<RadialProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double previousPercentage;

  @override
  void initState() {
    previousPercentage = widget.percentage;

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final difference = widget.percentage - previousPercentage;
    previousPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _RadialProgressPainter(
              arcPercentage: (widget.percentage - difference) +
                  (difference * controller.value),
            ),
          ),
        );
      },
    );
  }
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