import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final _translucentWhite = Colors.white.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _IconHeaderBackground(),
      Positioned(
        child: FaIcon(
          FontAwesomeIcons.plus,
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
            'Has solicitado',
            style: TextStyle(fontSize: 20, color: _translucentWhite),
          ),
          SizedBox(height: 20),
          Text(
            'Asistencia Médica',
            style: TextStyle(
              fontSize: 25,
              color: _translucentWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          FaIcon(FontAwesomeIcons.plus, size: 80, color: Colors.white)
        ],
      )
    ]);
  }
}

class _IconHeaderBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff526BF7),
          Color(0xff67ACF2),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
      ),
    );
  }
}
