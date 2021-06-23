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
    var math;
    return Transform.rotate(
      angle: 0.08,
      child: Container(
        height: 300,
        width: 500,
        color: Colors.orange,
      ),
    );
  }
}
