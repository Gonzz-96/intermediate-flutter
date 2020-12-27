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
  AnimationController controller;
  Animation<double> rotation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );

    rotation = Tween(begin: 0.0, end: 2.0 * 3.14).animate(controller);

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
          print(rotation.value);
          return Transform.rotate(
            child: _Rectangle(),
            angle: rotation.value,
          );
        });
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
