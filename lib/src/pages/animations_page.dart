import 'dart:math' as Math;

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRectangle(),
      ),
    );
  }
}

class AnimatedRectangle extends StatefulWidget {
  @override
  _AnimatedRectangleState createState() => _AnimatedRectangleState();
}

class _AnimatedRectangleState extends State<AnimatedRectangle>
    with SingleTickerProviderStateMixin {
  // NOTE: all of the aimatinos are associated with
  // the controller. They won't be finished until
  // the controller finishes the whole animation.
  AnimationController controller;
  Animation<double> rotation;
  Animation<double> opacity;
  Animation<double> opacityFadeOut;
  Animation<double> xAxisTranslation;
  Animation<double> squareScale;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.elasticOut,
      ),
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
    );

    opacityFadeOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1, curve: Curves.easeOut),
      ),
    );

    xAxisTranslation = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.bounceOut,
      ),
    );

    squareScale = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    controller.addListener(() {
      // this listener is going to be executed every time
      // the value of the animation changes
      // there is another function called addStatusListener
      // that only works with the STATUS of the controller

      // print('Status: ${controller.status}');
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
        controller.forward();
      }
    });

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(xAxisTranslation.value, 0.0),
          child: Transform.rotate(
            child: Opacity(
              child: Transform.scale(
                scale: squareScale.value,
                child: _Rectangle(),
              ),
              opacity: opacity.value - opacityFadeOut.value,
            ),
            angle: rotation.value,
          ),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
    );
  }
}
