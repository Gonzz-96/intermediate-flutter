import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intermediate_flutter/src/widgets/icon_header.dart';

class EmergencyPage extends StatelessWidget {
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
