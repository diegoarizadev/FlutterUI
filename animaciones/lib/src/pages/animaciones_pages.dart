import 'package:flutter/material.dart';

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

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, //Cuadros por segundo
        duration: const Duration(milliseconds: 4000));

    rotacion = Tween(
      //Tipo de animación a ejecutar
      begin: 0.0, //Inicio de la animación, para este caso 0.0 grados.
      end: 2.0, //Fin de la animación, para este caso 2.0 grados.
    ).animate(controller); //Controlador de la animación.

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

    return AnimatedBuilder(
      animation: controller, //Controlador de la animación
      // child: _Rectangulo(), //Opcional.!
      builder: (BuildContext context, Widget? child) {
        print(rotacion.value);
        return Transform.rotate(
            //Se aplica la animación para verlo en la pantalla
            angle: rotacion.value,
            child: _Rectangulo());
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
