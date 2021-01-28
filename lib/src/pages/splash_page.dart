import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _PrincipalMenu(),
      appBar: AppBar(
        title: Text('Intermediate Flutter Course'),
        backgroundColor: Colors.blue,
      ),
      body: _ScreensList(),
    );
  }
}

class _PrincipalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'GC',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _ScreensList()),
            ListTile(
              leading: Icon(Icons.lightbulb, color: Colors.blueAccent),
              trailing: Switch.adaptive(
                value: true,
                onChanged: null,
                activeColor: Colors.blueAccent,
              ),
              title: Text('Dark Mode'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading:
                    Icon(Icons.add_to_home_screen, color: Colors.blueAccent),
                trailing: Switch.adaptive(
                  value: true,
                  onChanged: null,
                  activeColor: Colors.blueAccent,
                ),
                title: Text('Custom Theme'),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
        children: [
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.slideshare,
              color: Colors.blueAccent,
            ),
            title: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.chevron_right,
                color: Colors.blueAccent,
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

class _ScreensList extends StatelessWidget {
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
    return ListView.builder(
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
    );
  }

  void _navigateTo(Widget screen, BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
}
