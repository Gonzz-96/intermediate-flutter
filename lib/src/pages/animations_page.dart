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

class _AnimatedRectangleState extends State<AnimatedRectangle> {
  @override
  Widget build(BuildContext context) {
    return _Rectangle();
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
