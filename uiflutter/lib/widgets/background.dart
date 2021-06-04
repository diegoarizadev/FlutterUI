import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  //const Background({Key? key}) : super(key: key);

  final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.8],
          colors: [Color(0xff2e305f), Color(0xff202333)]));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //Color morado del fondo.!
          decoration: boxDecoration,
        ),
        //Caja Rosada
        Positioned(
            //Positioned Tiene la capacidad de ubicar un Widget segun las coordenadas.
            top: -100,
            left: 10,
            child: _PinkBox()),
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      //Transform.rotate Giro del Widget
      angle: -pi / 3.0, //Angulo de giro
      child: Container(
        width: 320,
        height: 320,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(251, 142, 172, 1)
            ]),
            borderRadius: BorderRadius.circular(80)),
      ),
    );
  }
}
