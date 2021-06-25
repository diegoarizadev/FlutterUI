import 'package:custompainter/src/widgets/radial_progress.dart';
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
        child: Container(
          width: 400,
          height: 400,
          color: Colors.orange,
          child: RadialProgressCustom(percentage: 40),
          //Text('$porcentage %',
          //     style:
          //         const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
