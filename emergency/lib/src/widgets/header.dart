import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String tittle;
  final String subTittle;
  final Color color0ne;
  final Color colorTw0;

  const IconHeader({
    required this.icon,
    required this.tittle,
    required this.subTittle,
    this.color0ne = Colors.grey,
    this.colorTw0 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    final colorWhite = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground(
          color0ne: this.color0ne,
          colorTw0: this.colorTw0,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            this.icon,
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
              this.tittle,
              style: TextStyle(fontSize: 20, color: colorWhite),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.subTittle,
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
              this.icon,
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
  final Color color0ne;
  final Color colorTw0;

  const _IconHeaderBackground({
    required this.color0ne,
    required this.colorTw0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(75),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            this.color0ne,
            this.colorTw0,
          ],
        ),
      ),
    );
  }
}
