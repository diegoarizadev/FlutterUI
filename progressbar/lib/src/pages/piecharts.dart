import 'package:custompainter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class PieChartsCustom extends StatefulWidget {
  @override
  State<PieChartsCustom> createState() => _PieChartsCustomState();
}

class _PieChartsCustomState extends State<PieChartsCustom> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            percentage += 10.0;
            if (percentage > 100) {
              percentage = 0;
            }
          });
        },
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          //color: Colors.orange,
          child: RadialProgressCustom(percentage: percentage),
          //Text('$porcentage %',
          //     style:
          //         const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
