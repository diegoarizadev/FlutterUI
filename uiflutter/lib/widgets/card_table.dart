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
    return Container(
      margin: EdgeInsets.all(15), //Separacion entre las tarjetas
      height: 180,
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(20),
      ),
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
                color: color, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
