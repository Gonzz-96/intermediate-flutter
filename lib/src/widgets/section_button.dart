import 'package:flutter/material.dart';

class SectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SectionButtonBackground();
  }
}

class _SectionButtonBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
      ),
    );
  }
}
