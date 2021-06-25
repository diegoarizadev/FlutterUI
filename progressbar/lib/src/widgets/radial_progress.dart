import 'package:flutter/material.dart';

class RadialProgressCustom extends StatefulWidget {
  final percentage;

  const RadialProgressCustom({this.percentage});

  @override
  _RadialProgressCustomState createState() => _RadialProgressCustomState();
}

class _RadialProgressCustomState extends State<RadialProgressCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${widget.percentage}'),
    );
  }
}
