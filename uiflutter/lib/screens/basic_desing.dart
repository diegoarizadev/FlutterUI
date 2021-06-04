import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  final String dataText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage('assets/landspace.jpg')),
          RowCustom(),
          ButtonSection(),
          TextSection(
            dataText: dataText,
          )
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  final String dataText;

  const TextSection({
    Key? key,
    required this.dataText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        this.dataText,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class RowCustom extends StatelessWidget {
  const RowCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Descripción del campo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Antioquia Medellín',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold)),
            ],
          ),
          Expanded(
              //Ocupa todo el espacio posible.
              child: Container()),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10), //Constraint para la parte derecha y izquierda
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottonCustom(icon: Icons.call, text: 'Call'),
          BottonCustom(icon: Icons.map_rounded, text: 'Route'),
          BottonCustom(icon: Icons.share, text: 'Share'),
        ],
      ),
    );
  }
}

class BottonCustom extends StatelessWidget {
  final IconData icon;
  final String text;

  const BottonCustom({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          color: Colors.blue,
          size: 35.0,
        ),
        Text(this.text, style: TextStyle(color: Colors.blue))
      ],
    );
  }
}
