import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool _activateAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1DA1F2),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeActivateVar,
        backgroundColor: Colors.pink,
        child: FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: ZoomOut(
          animate: _activateAnimation,
          duration: Duration(seconds: 2),
          from: 30,
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  void _changeActivateVar() {
    setState(() {
      _activateAnimation = !_activateAnimation;
    });
  }
}
