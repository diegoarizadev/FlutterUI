import 'dart:math';

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
          //color: Colors.orange,
          child: CustomPaint(
            painter: _MiRadialProgress(50),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final percentage;

  _MiRadialProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint() //Lapiz
      ..strokeWidth = 2
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset centro =
        Offset(size.width * 0.5, size.height / 2); //Centro del circulo.

    final double radio = min(size.width * 0.5, size.height * 0.5);

    //Como dibujarlo.
    canvas.drawCircle(
        centro, //Posición
        radio,
        paint);

    //Arco

    final paintArco = Paint() //Lapiz
      ..strokeWidth = 10
      ..color = Colors.green
      ..style = PaintingStyle.stroke;

    //Parte que se debe ir llenando.

    double arcAngle = 2 *
        pi *
        (percentage /
            100); //2 * pi es un circulo, completo y el resto de la formula es el porcentaje que se quiere ir llenando.

    //Dibujando el arco
    canvas.drawArc(
        Rect.fromCircle(
            center: centro, radius: radio), //Espacio donde se quiere colocar.
        -pi / 2, //startAngle, angulo inicial
        arcAngle, //sweepAngle, angulo de llenado
        false, //useCenter
        paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
