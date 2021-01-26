import 'package:flutter/material.dart';
import 'package:intermediate_flutter/src/challenges/animated_square_screen.dart';
import 'package:intermediate_flutter/src/pages/animate_do_page.dart';
import 'package:intermediate_flutter/src/pages/animations_page.dart';
import 'package:intermediate_flutter/src/pages/circular_graphics_page.dart';
import 'package:intermediate_flutter/src/pages/emergency_page.dart';
import 'package:intermediate_flutter/src/pages/headers_page.dart';
import 'package:intermediate_flutter/src/pages/pinterest_page.dart';
import 'package:intermediate_flutter/src/pages/slideshow_page.dart';
import 'package:intermediate_flutter/src/pages/sliver_list_page.dart';

class SplashPage extends StatelessWidget {
  final _screens = {
    'Custom Painter': HeadersPage(),
    'Custom Animations': AnimationsPage(),
    'Animations Challenge': AnimatesSquaredScreen(),
    'Circular Graphics': CircularGraphicsPage(),
    'Slideshow Page': SlideshowPage(),
    'Pinterest Page': PinterestPage(),
    'Emergency Layout': EmergencyPage(),
    'Sliver List / Appbar': SliverListPage(),
    'Animate Do': AnimateDoPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Intermediate Flutter Course',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _screens.length,
        itemBuilder: (context, index) {
          final pair = _screens.entries.toList()[index];

          return _ScreensItem(
            text: pair.key,
            onTap: () {
              _navigateTo(pair.value, context);
            },
            shouldHaveDivider: index != _screens.length - 1,
          );
        },
      ),
    );
  }

  void _navigateTo(Widget screen, BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
}

class _ScreensItem extends StatelessWidget {
  const _ScreensItem({
    this.text,
    this.onTap,
    this.shouldHaveDivider,
  });

  final String text;
  final Function onTap;
  final bool shouldHaveDivider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (shouldHaveDivider)
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black.withOpacity(0.3),
            )
        ],
      ),
    );
  }
}
