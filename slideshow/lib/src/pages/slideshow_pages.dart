import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatefulWidget {
  @override
  _SlideShowPageState createState() => _SlideShowPageState();
}

class _SlideShowPageState extends State<SlideShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/svg/s6.svg'),
      ),
    );
  }
}
