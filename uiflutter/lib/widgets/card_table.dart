import 'dart:ui';

import 'package:flutter/material.dart';

class CardTableCustom extends StatelessWidget {
  const CardTableCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      //Coleccion de Rows
      children: [
        TableRow(
          children: [
            _SingleCard(
              color: Colors.blue,
              icon: Icons.monetization_on_outlined,
              text: 'General',
            ),
            _SingleCard(
              color: Colors.indigoAccent,
              icon: Icons.car_rental_outlined,
              text: 'Transporte',
            )
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              color: Colors.pink,
              icon: Icons.shop_two,
              text: 'Compras',
            ),
            _SingleCard(
              color: Colors.orange,
              icon: Icons.padding,
              text: 'Facturas',
            )
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              color: Colors.deepPurple,
              icon: Icons.movie,
              text: 'Cine',
            ),
            _SingleCard(
              color: Colors.green,
              icon: Icons.local_grocery_store,
              text: 'Comestibles',
            )
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              color: Colors.deepPurple,
              icon: Icons.movie,
              text: 'Cine',
            ),
            _SingleCard(
              color: Colors.green,
              icon: Icons.local_grocery_store,
              text: 'Comestibles',
            )
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              color: Colors.white,
              size: 35,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15), //Separacion entre las tarjetas
      child: ClipRRect(
        //fuerza a que el blur no se salga y esto lo hace para todos los demas widgets
        borderRadius:
            BorderRadius.circular(20), //Se agrega para mantener el Blur
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            //margin: EdgeInsets.all(15), //Separacion entre las tarjetas
            height: 180,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: this.child,
          ),
        ),
      ),
    );
    ;
  }
}
