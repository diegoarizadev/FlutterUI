import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPages extends StatelessWidget {
  const AnimacionesPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  //Las animaciones deben ir con un StatefulWidget ya que se van a redibujar y destuirsen.

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin un controlador para una animación.

  late AnimationController controller; //control para manejar la animacion
  late Animation<double> rotacion; //Objeto animar, para este caso rotar.
  late Animation<double> opacidad; //Objeto animar.
  late Animation<double> moverDer; //Objeto animar.
  late Animation<double> escalar; //Objeto animar.

  @override
  void initState() {
    //Se ejecuta la primera vez que se ejecuta la App y se pueden colocar listener.
    controller = AnimationController(
        vsync: this, //Cuadros por segundo
        duration: const Duration(milliseconds: 4000));

    rotacion = Tween(
      //Tipo de animación a ejecutar
      begin: 0.0, //Inicio de la animación, para este caso 0.0 grados.
      end: 2 * Math.pi, //Fin de la animación, 2 vueltas
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack)); //Controlador de la animación.

    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeOut),
      ),
    ); //Traslucidad del objeto

    moverDer = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
        parent: controller, curve: Curves.easeInOutBack)); //Mover el objeto.

    escalar = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
        parent: controller, curve: Curves.easeInOutBack)); //Escalar el objeto.

    controller.addListener(() {
      //Cada vez que la animación cambia, este controlador sabe en que estado estado se encuentra (termino, inicio, en ejecucion) en fin..
//Se pueden controlar todas las etapas de la animación.
      //print('addListener = Status :${controller.status} ');
      if (controller.status == AnimationStatus.completed) {
        //Si la animación termino.

        controller.reset(); //Se realizara la inversa de la animación.
      }
    });
    controller.forward(); //Iniciar animación, mejor control en esta ubicación.
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(); //Iniciar animación.
    //controller.repeat(); //Iniciar animación.
    return AnimatedBuilder(
      animation: controller, //Controlador de la animación
      child: _Rectangulo(), //Opcional.!
      builder: (BuildContext context, Widget? child) {
        print(
            'builder = Opacidad :${opacidad.value} '); //identificar cuando una animación llego al final.
        print(
            'builder = rotacion :${rotacion.value} '); //identificar cuando una animación llego al final.
        print(rotacion.value);
        return Transform.translate(
          offset: Offset(moverDer.value, 0), //mover a la derecha
          child: Transform.rotate(
              //Se aplica la animación para verlo en la pantalla
              angle: rotacion.value,
              child: Opacity(
                opacity: opacidad.value,
                child: Transform.scale(
                  scale: escalar.value,
                  child: child,
                ),
              )),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
