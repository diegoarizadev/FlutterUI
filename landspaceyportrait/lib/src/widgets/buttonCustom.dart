import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottonCuston extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color0ne;
  final Color colorTw0;
  final Function() onPress;

  const BottonCuston(
      {required this.icon,
      required this.text,
      required this.color0ne,
      required this.colorTw0,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _BottonCustomBackground(
            icon: this.icon,
            color0ne: this.color0ne,
            colorTw0: this.colorTw0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                this.icon,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  this.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              SizedBox(
                width: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottonCustomBackground extends StatelessWidget {
  final IconData icon;
  final Color color0ne;
  final Color colorTw0;
  //final Function onPress;

  const _BottonCustomBackground({
    required this.icon,
    required this.color0ne,
    required this.colorTw0,
    //required this.onPress
  });
//
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        //Sirve para cortar la imagen, ya que esta se sale del contenedor.
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
//          color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            this.color0ne,
            this.colorTw0,
          ],
        ),
      ),
    );
  }
}
