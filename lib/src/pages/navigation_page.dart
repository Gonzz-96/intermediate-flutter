import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Page'),
        backgroundColor: Colors.pink,
      ),
      floatingActionButton: FloatingButton(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone),
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  child: Text(
                    '10',
                    style: TextStyle(color: Colors.white, fontSize: 7),
                  ),
                  alignment: Alignment.center,
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog),
        )
      ],
      selectedItemColor: Colors.pink,
    );
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pink,
    );
  }
}
