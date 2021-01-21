import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intermediate_flutter/src/widgets/icon_header.dart';
import 'package:intermediate_flutter/src/widgets/section_button.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SectionButton(
          text: 'Motor Accident',
          iconData: FontAwesomeIcons.carCrash,
          onPress: () {},
        ),
      ),
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
