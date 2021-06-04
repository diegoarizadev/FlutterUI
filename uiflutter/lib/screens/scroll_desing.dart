import 'package:flutter/material.dart';

class ScrollDesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      //Permite colocar Widget, uno encima del otro.
      children: [Background(), MainContent()],
    ));
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
