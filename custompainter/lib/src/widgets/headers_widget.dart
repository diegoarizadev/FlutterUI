import 'package:flutter/material.dart';

//Cuadro/Header Sencillo.
class HeaderSqare extends StatelessWidget {
  const HeaderSqare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.orange,
    );
  }
}

//Cuadro/Header con bordes redobeados en la parte inferior.
class HeadersRoundedEdges extends StatelessWidget {
  const HeadersRoundedEdges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}

//Cuadro/Header con una diagonal
class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity, //Todo el alto
      width: double.infinity, //Todo el ancho
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Lienzo y tamaño de la pantalla

    final paint = Paint(); //elemento para dibujar (Lapiz).
    //Propiedades del elemento paint.
    paint.color = Colors.orange; //Color del lapiz.
    paint.style = PaintingStyle
        .fill; //Relleno del lapiz, .storke dibuja lineas y .fill hace todo el relleno
    paint.strokeWidth = 5; //Ancho del lapiz

    final path = new Path(); //Dibujo de la forma.

    path.moveTo(
        0,
        size.height *
            0.35); //El lapiz se va a mover del inicio (esquina superior izquierda) hasta la mitad inferior

    path.lineTo(
        size.width,
        size.height *
            0.30); //Segundo movimiento del lapiz, dibujar de la mitad inferior izquierda, hacia la derecha en linea recta.

    path.lineTo(size.width,
        0); //tercer movimiento del lapiz. de la mitad inferior derecha a la esquina superior derecha.

    path.lineTo(0,
        0); //cuarto movimiento del lapiz. desde la esquina superior derecha a la izquierda.

    // path.lineTo(
    //     0,
    //     size.height *
    //         0.5); //quinto movimiento del lapiz. desde la esquina superior izquierda hasta la mitad de la pantalla del costado izquierdo. ESTA LINEA ES OPCIONAL PARA EL RELLENO.

    canvas.drawPath(path,
        paint); //Este elemento ejecuta las acciones anteriore o realiza los trazos.
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; //Se coloca true, ya que el grafico a realizar no es tan pesado, en caso de serlo (peasdo), se debe cambiar.
  }
}
