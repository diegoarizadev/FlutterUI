import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final colorWhite = Colors.white.withOpacity(0.7);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 80,
              width: double
                  .infinity, //Este widget se expande al ancho del dispositivo lo cual centra todos los elementos.
            ),
            Text(
              'Haz solicitado',
              style: TextStyle(fontSize: 20, color: colorWhite),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Asistencia Medica',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: colorWhite,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(
              FontAwesomeIcons.plus,
              size: 80,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
//        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(75),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff526BF6),
            Color(0xff67ACF2),
          ],
        ),
      ),
    );
  }
}
