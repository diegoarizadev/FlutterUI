import 'package:custompainter/src/widgets/headersCustom_widget.dart';
import 'package:flutter/material.dart';

class HeadersCustom extends StatefulWidget {
  //const HeadersCustom({Key? key}) : super(key: key);

  @override
  _HeadersCustomState createState() => _HeadersCustomState();
}

class _HeadersCustomState extends State<HeadersCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeaderWavesGradient(),
    );
  }
}
