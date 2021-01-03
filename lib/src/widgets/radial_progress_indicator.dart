import 'dart:math' as Math;

import 'package:flutter/material.dart';

class RadialProgressIndicator extends StatefulWidget {
  RadialProgressIndicator({
    @required this.percentage,
    this.primaryBarWidth = BarWidth.medium,
    this.secondaryBarWidth = BarWidth.thin,
    this.primaryColor = Colors.pink,
    this.secondaryColor = Colors.grey,
  });

  final double percentage;
  final BarWidth primaryBarWidth;
  final BarWidth secondaryBarWidth;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  _RadialProgressIndicatorState createState() =>
      _RadialProgressIndicatorState();
}

class _RadialProgressIndicatorState extends State<RadialProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> progressAnimation;
  double previousPercentage;

  @override
  void initState() {
    previousPercentage = widget.percentage;

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    progressAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutQuint,
      ),
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
              (widget.percentage - difference) +
                  (difference * progressAnimation.value),
              _getValueFromBarWidth(widget.primaryBarWidth),
              _getValueFromBarWidth(widget.secondaryBarWidth),
              widget.primaryColor,
              widget.secondaryColor,
            ),
          ),
        );
      },
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  _RadialProgressPainter(
    this.arcPercentage,
    this.primaryBarWidth,
    this.secondaryBarWidth,
    this.primaryColor,
    this.secondaryColor,
  );

  double arcPercentage;
  double primaryBarWidth;
  double secondaryBarWidth;
  Color primaryColor;
  Color secondaryColor;

  @override
  void paint(Canvas canvas, Size size) {
    // complete circle
    final circlePaint = Paint()
      ..strokeWidth = secondaryBarWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final centerOffset = Offset(size.width * .5, size.height * 0.5);
    final radius = Math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(centerOffset, radius, circlePaint);

    // arc
    final arcPaint = Paint()
      ..strokeWidth = primaryBarWidth
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
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

enum BarWidth {
  thin,
  medium,
  thick,
}

double _getValueFromBarWidth(BarWidth width) {
  switch (width) {
    case BarWidth.thin:
      return 4.0;
      break;
    case BarWidth.medium:
      return 10.0;
      break;
    case BarWidth.thick:
      return 15.0;
      break;
    default:
      return 4.0;
      break;
  }
}
