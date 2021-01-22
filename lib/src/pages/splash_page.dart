import 'package:flutter/material.dart';
import 'package:intermediate_flutter/src/challenges/animated_square_screen.dart';
import 'package:intermediate_flutter/src/pages/animations_page.dart';
import 'package:intermediate_flutter/src/pages/circular_graphics_page.dart';
import 'package:intermediate_flutter/src/pages/emergency_page.dart';
import 'package:intermediate_flutter/src/pages/headers_page.dart';
import 'package:intermediate_flutter/src/pages/pinterest_page.dart';
import 'package:intermediate_flutter/src/pages/slideshow_page.dart';

class SplashPage extends StatelessWidget {
  final _screens = {
    'Custom Painter': HeadersPage(),
    'Custom Animations': AnimationsPage(),
    'Animations Challenge': AnimatesSquaredScreen(),
    'Circular Graphics': CircularGraphicsPage(),
    'Slideshow Page': SlideshowPage(),
    'Pinterest Page': PinterestPage(),
    'Emergency Layout': EmergencyPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intermediate Flutter Course'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: ListView.builder(
          itemCount: _screens.length,
          itemBuilder: (context, index) {
            final pair = _screens.entries.toList()[index];

            return _FlatButton(
              text: pair.key,
              onTap: () {
                _navigateTo(pair.value, context);
              },
            );
          },
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
      padding: const EdgeInsets.only(bottom: 30.0),
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
