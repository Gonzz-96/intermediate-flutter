import 'package:flutter/material.dart';

class AnimatesSquaredScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _AnimatedSquare(size: MediaQuery.of(context).size),
      ),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  _AnimatedSquare({this.size});

  final Size size;

  @override
  __AnimatedSquareState createState() => __AnimatedSquareState();
}

class __AnimatedSquareState extends State<_AnimatedSquare>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rightTranslation;
  Animation<double> upwardTranslation;
  Animation<double> leftTranslation;
  Animation<double> downwardsTranslation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    rightTranslation = Tween(begin: 0.0, end: widget.size.width * 0.35).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut),
      ),
    );

    upwardTranslation =
        Tween(begin: 0.0, end: -widget.size.width * 0.35).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut),
      ),
    );

    leftTranslation = Tween(begin: 0.0, end: widget.size.width * 0.35).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut),
      ),
    );

    downwardsTranslation =
        Tween(begin: 0.0, end: -widget.size.width * 0.35).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut),
      ),
    );

    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            rightTranslation.value - leftTranslation.value,
            upwardTranslation.value - downwardsTranslation.value,
          ),
          child: _Rectangle(),
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
