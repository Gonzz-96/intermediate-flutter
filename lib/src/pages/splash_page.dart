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
import 'package:intermediate_flutter/src/theme/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      drawer: _PrincipalMenu(),
      appBar: AppBar(
        title: Text(
          'Intermediate Flutter Course',
        ),
        backgroundColor: appTheme.darkTheme
            ? Colors.grey[1000]
            : appTheme.currentTheme.primaryColor,
      ),
      body: _ScreensList(),
    );
  }
}

class _PrincipalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final currentTheme = appTheme.currentTheme;
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 100,
                child: CircleAvatar(
                  backgroundColor: currentTheme.accentColor,
                  child: Text(
                    'GC',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _ScreensList()),
            ListTile(
              leading: Icon(Icons.lightbulb, color: currentTheme.accentColor),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                onChanged: (value) => appTheme.darkTheme = value,
                activeColor: currentTheme.accentColor,
              ),
              title: Text('Dark Mode'),
            ),
            SafeArea(
              bottom: true,
              top: false,
              right: false,
              left: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen,
                    color: currentTheme.accentColor),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  onChanged: (value) => appTheme.customTheme = value,
                  activeColor: currentTheme.accentColor,
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
    this.icon,
    this.text,
    this.onTap,
    this.shouldHaveDivider,
  });

  final IconData icon;
  final String text;
  final Function onTap;
  final bool shouldHaveDivider;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: FaIcon(
                icon,
                color: appTheme.accentColor,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.chevron_right,
                color: appTheme.accentColor,
              ),
            ),
          ),
          if (shouldHaveDivider)
            Container(
              width: double.infinity,
              height: 1,
              color: appTheme.primaryColorLight,
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

  final _icons = [
    FontAwesomeIcons.heading,
    FontAwesomeIcons.peopleCarry,
    FontAwesomeIcons.play,
    FontAwesomeIcons.circleNotch,
    FontAwesomeIcons.slideshare,
    FontAwesomeIcons.pinterest,
    FontAwesomeIcons.ambulance,
    FontAwesomeIcons.mobile,
    FontAwesomeIcons.infinity,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: _screens.length,
      itemBuilder: (context, index) {
        final pair = _screens.entries.toList()[index];
        return _ScreensItem(
          text: pair.key,
          icon: _icons[index],
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
