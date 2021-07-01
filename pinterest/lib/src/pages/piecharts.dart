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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentage: percentage,
                  colorPrimary: Colors.green,
                  colorSecundary: Colors.grey.shade300,
                  thicknessPrimary: 10.0,
                  thicknessSecundary: 10.0,
                ),
                CustomRadialProgress(
                  percentage: percentage,
                  colorPrimary: Colors.red,
                  colorSecundary: Colors.grey.shade300,
                  thicknessPrimary: 10.0,
                  thicknessSecundary: 5.0,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentage: percentage,
                  colorPrimary: Colors.purple,
                  colorSecundary: Colors.grey.shade300,
                  thicknessPrimary: 10.0,
                  thicknessSecundary: 10.0,
                ),
                CustomRadialProgress(
                  percentage: percentage,
                  colorPrimary: Colors.blue,
                  colorSecundary: Colors.grey.shade300,
                  thicknessPrimary: 10.0,
                  thicknessSecundary: 20.0,
                )
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    required this.percentage,
    required this.colorPrimary,
    required this.colorSecundary,
    required this.thicknessPrimary,
    required this.thicknessSecundary,
  });

  final double percentage;
  final Color colorPrimary;
  final Color colorSecundary;
  final double thicknessPrimary;
  final double thicknessSecundary;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        height: 180,
        child: RadialProgressCustom(
          percentage: percentage,
          colorPrimary: colorPrimary,
          colorSecundary: colorSecundary,
          thicknessPrimary: thicknessPrimary,
          thicknessSecundary: thicknessSecundary,
        ));
  }
}
