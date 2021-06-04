import 'package:flutter/material.dart';

class ScrollDesignScreen extends StatelessWidget {
  final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter, //direccion del gradiante
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5], //Puntos de quiebre o mitad de la pantalla
          colors: [Color(0xff5ee8c5), Color(0xff33BAD6)]));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color(0xff33BAD6), //Se agrega color en el fondo para evitar ver el blanco del bounces
        body: Container(
      decoration: boxDecoration,
      child: PageView(
        //Por defectos, esete componente, tiene Scroll  Horizontal
        scrollDirection: Axis.vertical, //Cambia la direccion del scroll
        physics: BouncingScrollPhysics(), //Efecto de rebote de IOS en Android.
        children: [PageOne(), PageTwo()],
      ),
    ));
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      //Permite colocar Widget, uno encima del otro.
      children: [Background(), MainContent()],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white);
    return SafeArea(
      //Este widget tiene encuenta los nouch o camaras, espacios de los telefonos.
      bottom: false, //No proteja la parte inferior.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
          ),
          Text(
            '11 Grados',
            style: textStyle,
          ),
          Text('Jueves', style: textStyle),
          Expanded(child: Container()),
          Icon(
            Icons.keyboard_arrow_down,
            size: 100,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(
          0xff33BAD6), //Se agrega el color azul del agua de la imagen al fondo del contenedor.
      height: double.infinity, //Tome todo el espacio de la pantalla
      alignment: Alignment.topCenter, //ubica la imagen en la parte superior.
      child: Image(
        image: AssetImage('assets/scroll.png'),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff33BAD6),
      child: Center(
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xff0098FA),
              shape: StadiumBorder(),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Bienvenido',
                style: TextStyle(color: Colors.white, fontSize: 29.0),
              ),
            )),
      ),
    );
  }
}
