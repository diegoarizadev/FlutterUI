import 'package:flutter/material.dart';

class PieChartsCustom extends StatefulWidget {
  const PieChartsCustom({Key? key}) : super(key: key);

  @override
  State<PieChartsCustom> createState() => _PieChartsCustomState();
}

class _PieChartsCustomState extends State<PieChartsCustom> {
  double porcentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentage += 10.0;
            if (porcentage > 100) {
              porcentage = 0;
            }
          });
        },
      ),
      body: Center(
        child: Text(
          '$porcentage %',
          style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
