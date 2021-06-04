import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final textStyleTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final textStyleNormal = TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false, //No se preocupe por la parte inferior.
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 20), //Separación del borde de la pantalla del texto
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, //Alineacion de los textos
          children: [
            Text(
              'Clasificar transacción',
              style: textStyleTitle,
            ),
            SizedBox(
              //Separación de los textos
              height: 10,
            ),
            Text('Clasifique esta transacción en una categoría particular',
                style: textStyleNormal)
          ],
        ),
      ),
    );
  }
}
