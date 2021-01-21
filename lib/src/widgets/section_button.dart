import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _SectionButtonBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 140, width: 40),
            FaIcon(FontAwesomeIcons.carCrash, color: Colors.white, size: 40),
            SizedBox(height: 140, width: 20),
            Expanded(
              child: Text(
                'Motor Accident',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
            SizedBox(width: 40),
          ],
        ),
      ],
    );
  }
}

class _SectionButtonBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                FontAwesomeIcons.carCrash,
                color: Colors.white.withOpacity(0.2),
                size: 150,
              ),
            ),
          ],
        ),
      ),
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [
          Color(0xFF6989F5),
          Color(0xFF906EF5),
        ]),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(4, 6),
              blurRadius: 10),
        ],
      ),
    );
  }
}
