import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: FaIcon(FontAwesomeIcons.play),
      ),
      backgroundColor: Color(0xff1da1f2),
      body: Center(
        child: ZoomOut(
          animate: false, //No se anime,
          from: 30, //30 veces mas grande.
          duration: Duration(seconds: 1),
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 45,
          ),
        ),
      ),
    );
  }
}
