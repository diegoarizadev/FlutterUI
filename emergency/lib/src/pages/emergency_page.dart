import 'package:emergency/src/widgets/buttonCustom.dart';
import 'package:emergency/src/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: PageHeader(),
      body: Center(
        child: BottonCuston(),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plusCircle,
      tittle: 'Haz solicitado.',
      subTittle: 'Asistencia Medica.',
      color0ne: Color(0xff526BF6),
      colorTw0: Color(0xff67ACF2),
    );
  }
}
