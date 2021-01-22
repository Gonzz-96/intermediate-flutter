import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SectionButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final IconData iconData;
  final Color initialColor;
  final Color endColor;

  const SectionButton({
    @required this.text,
    @required this.onPress,
    this.iconData = FontAwesomeIcons.circle,
    this.initialColor = const Color(0xFF6989F5),
    this.endColor = const Color(0xFF906EF5),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        _SectionButtonBackground(initialColor, endColor, iconData),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 40),
            FaIcon(iconData, color: Colors.white, size: 40),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
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
  final Color initialColor;
  final Color endColor;
  final IconData iconData;

  const _SectionButtonBackground(
    this.initialColor,
    this.endColor,
    this.iconData,
  );

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
                iconData,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height / 9,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [initialColor, endColor]),
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
