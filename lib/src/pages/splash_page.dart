import 'package:flutter/material.dart';
import 'package:intermediate_flutter/src/challenges/animated_square_screen.dart';
import 'package:intermediate_flutter/src/pages/animations_page.dart';
import 'package:intermediate_flutter/src/pages/circular_graphics_page.dart';
import 'package:intermediate_flutter/src/pages/headers_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intermediate Flutter Course'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _FlatButton(
              text: 'Custom Painter',
              onTap: () => _navigateTo(HeadersPage(), context),
            ),
            _FlatButton(
              text: 'Custom Animations',
              onTap: () => _navigateTo(AnimationsPage(), context),
            ),
            _FlatButton(
              text: 'Animations Challenge',
              onTap: () => _navigateTo(AnimatesSquaredScreen(), context),
            ),
            _FlatButton(
              text: 'Circular Graphics',
              onTap: () => _navigateTo(CircularGraphicsPage(), context),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(Widget screen, BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
}

class _FlatButton extends StatelessWidget {
  const _FlatButton({
    this.text,
    this.onTap,
  });

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: FlatButton(
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: onTap,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
