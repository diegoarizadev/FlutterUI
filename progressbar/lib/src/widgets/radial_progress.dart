import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgressCustom extends StatefulWidget {
  final double percentage;

  const RadialProgressCustom({required this.percentage});

  @override
  _RadialProgressCustomState createState() => _RadialProgressCustomState();
}

class _RadialProgressCustomState extends State<RadialProgressCustom>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentageAdove;

  @override
  Widget build(BuildContext context) {
    controller.forward(
        from:
            0.0); //iniciar la animación y cada vez que se reinicie el widget empezara en 0

    //diferencia para animar.
    final double diferenceAnimated = widget.percentage - porcentageAdove;
    porcentageAdove = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity, //Ocupa todo el espacio del padre.
          height: double.infinity, //Ocupa todo el espacio del padre.
          child: CustomPaint(
              painter: _MiRadialProgress(
                  (widget.percentage - diferenceAnimated) +
                      (diferenceAnimated * controller.value))),
        );
      },
    );
  }

  @override
  void initState() {
    //Configuración de la animación

    porcentageAdove = widget.percentage; //Valor enviado inicialmente.
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _MiRadialProgress extends CustomPainter {
  final double percentage;

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
      ..color = Colors.red
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
