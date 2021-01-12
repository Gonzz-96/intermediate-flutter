import 'package:flutter/material.dart';

class PinterestMenu extends StatelessWidget {
  final items = <PinterestButton>[
    PinterestButton(
      icon: Icons.pie_chart,
      onPressed: () {
        print('Icon pie_chart');
      },
    ),
    PinterestButton(
      icon: Icons.search,
      onPressed: () {
        print('Icon search');
      },
    ),
    PinterestButton(
      icon: Icons.notifications,
      onPressed: () {
        print('Icon notifications');
      },
    ),
    PinterestButton(
      icon: Icons.supervised_user_circle,
      onPressed: () {
        print('Icon supervised_user_circle');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.75,
        height: size.height * 0.075,
        child: _MenuItems(items),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5),
          ],
        ),
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  _MenuItems(this.menuItems);

  final List<PinterestButton> menuItems;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) => _PinterestMenuButton(index, menuItems[index]),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  _PinterestMenuButton(this.index, this.item);

  final int index;
  final PinterestButton item;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(item.icon),
    );
  }
}

class PinterestButton {
  PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });

  final Function onPressed;
  final IconData icon;
}
