import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool activateAnimated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            activateAnimated = true;
          });
        },
        backgroundColor: Colors.red,
        child: FaIcon(FontAwesomeIcons.play),
      ),
      backgroundColor: Color(0xff1da1f2),
      body: Center(
        child: ZoomOut(
          animate: activateAnimated, //activa la animación,
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
