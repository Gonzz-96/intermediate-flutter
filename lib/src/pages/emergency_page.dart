import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intermediate_flutter/src/widgets/icon_header.dart';
import 'package:intermediate_flutter/src/widgets/section_button.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 180),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 80),
              ..._items.map<Widget>((i) => SectionButton(
                    iconData: i.iconData,
                    initialColor: i.initialColor,
                    endColor: i.endColor,
                    text: i.text,
                    onPress: () {},
                  )),
            ],
          ),
        ),
        IconHeader(
          iconData: FontAwesomeIcons.plus,
          title: 'Has solicitado',
          subtitle: 'Asistencia Médica',
        ),
      ]),
    );
  }
}

class Temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionButton(
      text: 'Motor Accident',
      iconData: FontAwesomeIcons.carCrash,
      onPress: () {},
    );
  }
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconHeader(
        iconData: FontAwesomeIcons.plus,
        title: 'Has solicitado',
        subtitle: 'Asistencia médica',
      ),
    );
  }
}

class _ButtonItem {
  final IconData iconData;
  final String text;
  final Color initialColor;
  final Color endColor;

  _ButtonItem(this.iconData, this.text, this.initialColor, this.endColor);
}

final _items = <_ButtonItem>[
  _ButtonItem(
    FontAwesomeIcons.carCrash,
    'Motor Accident',
    Color(0xff6989F5),
    Color(0xff906EF5),
  ),
  _ButtonItem(
    FontAwesomeIcons.plus,
    'Medical Emergency',
    Color(0xff66A9F2),
    Color(0xff536CF6),
  ),
  _ButtonItem(
    FontAwesomeIcons.theaterMasks,
    'Theft / Harrasement',
    Color(0xffF2D572),
    Color(0xffE06AA3),
  ),
  _ButtonItem(
    FontAwesomeIcons.biking,
    'Awards',
    Color(0xff317183),
    Color(0xff46997D),
  ),
  _ButtonItem(
    FontAwesomeIcons.carCrash,
    'Motor Accident',
    Color(0xff6989F5),
    Color(0xff906EF5),
  ),
  _ButtonItem(
    FontAwesomeIcons.plus,
    'Medical Emergency',
    Color(0xff66A9F2),
    Color(0xff536CF6),
  ),
  _ButtonItem(
    FontAwesomeIcons.theaterMasks,
    'Theft / Harrasement',
    Color(0xffF2D572),
    Color(0xffE06AA3),
  ),
  _ButtonItem(
    FontAwesomeIcons.biking,
    'Awards',
    Color(0xff317183),
    Color(0xff46997D),
  ),
  _ButtonItem(
    FontAwesomeIcons.carCrash,
    'Motor Accident',
    Color(0xff6989F5),
    Color(0xff906EF5),
  ),
  _ButtonItem(
    FontAwesomeIcons.plus,
    'Medical Emergency',
    Color(0xff66A9F2),
    Color(0xff536CF6),
  ),
  _ButtonItem(
    FontAwesomeIcons.theaterMasks,
    'Theft / Harrasement',
    Color(0xffF2D572),
    Color(0xffE06AA3),
  ),
  _ButtonItem(
    FontAwesomeIcons.biking,
    'Awards',
    Color(0xff317183),
    Color(0xff46997D),
  ),
];
