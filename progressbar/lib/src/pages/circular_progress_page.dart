import 'package:flutter/material.dart';

class CircularProgressCustom extends StatefulWidget {
  const CircularProgressCustom({Key? key}) : super(key: key);

  @override
  _CircularProgressCustomState createState() => _CircularProgressCustomState();
}

class _CircularProgressCustomState extends State<CircularProgressCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.orange,
        ),
      ),
    );
  }
}
