import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications Page'),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: FloatingButton(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<_NotificationModel>(context)._number;

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
                child: BounceInDown(
                  controller: (controller) {
                    Provider.of<_NotificationModel>(context).bounceController =
                        controller;
                  },
                  from: 15,
                  animate: notifications > 0,
                  child: _NotificationDot(notifications: notifications),
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

class _NotificationDot extends StatelessWidget {
  const _NotificationDot({
    Key key,
    @required this.notifications,
  }) : super(key: key);

  final int notifications;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "$notifications",
        style: TextStyle(color: Colors.white, fontSize: 9),
      ),
      alignment: Alignment.center,
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle,
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final model = Provider.of<_NotificationModel>(context, listen: false);
        model.number++;

        if (model.number >= 2) {
          model.bounceController.forward(from: 0.0);
        }
      },
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pink,
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  AnimationController bounceController;

  int get number => _number;

  set number(int newNumber) {
    _number = newNumber;
    notifyListeners();
  }
}
