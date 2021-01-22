import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final Color initialColor;
  final Color endColor;

  final _translucentWhite = Colors.white.withOpacity(0.7);

  IconHeader({
    @required this.iconData,
    @required this.title,
    @required this.subtitle,
    this.initialColor = const Color(0xff526BF7),
    this.endColor = const Color(0xff67ACF2),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _IconHeaderBackground(initialColor, endColor),
      Positioned(
        child: FaIcon(
          iconData,
          size: 250,
          color: Colors.white.withOpacity(0.2),
        ),
        top: -50,
        left: -70,
      ),
      Column(
        children: [
          SizedBox(height: 80, width: double.infinity),
          Text(
            title,
            style: TextStyle(fontSize: 20, color: _translucentWhite),
          ),
          SizedBox(height: 20),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 25,
              color: _translucentWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          FaIcon(iconData, size: 80, color: Colors.white)
        ],
      )
    ]);
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color initialColor;
  final Color endColor;

  const _IconHeaderBackground(
    this.initialColor,
    this.endColor,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          initialColor,
          endColor,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
      ),
    );
  }
}
