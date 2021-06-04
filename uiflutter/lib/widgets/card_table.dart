import 'package:flutter/material.dart';

class CardTableCustom extends StatelessWidget {
  const CardTableCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      //Coleccion de Rows
      children: [
        TableRow(children: [_SingleCard(), _SingleCard()]),
        TableRow(children: [_SingleCard(), _SingleCard()]),
        TableRow(children: [_SingleCard(), _SingleCard()]),
        TableRow(children: [_SingleCard(), _SingleCard()]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  const _SingleCard({Key? key}) : super(key: key);

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
            backgroundColor: Colors.blue,
            radius: 30,
            child: Icon(
              Icons.monetization_on_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'General',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
