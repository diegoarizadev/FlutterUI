import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Pages'),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: ButtonFloating(),
      bottomNavigationBar: ButtonMavigation(),
    );
  }
}

class ButtonMavigation extends StatelessWidget {
  const ButtonMavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.bone,
            ),
            title: Text('Bone'),
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                FaIcon(
                  FontAwesomeIcons.bell,
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    child: Text(
                      '99',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 7.0),
                    ),
                    alignment: Alignment.center,
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: Colors.redAccent, shape: BoxShape.circle),
                  ),
                )
              ],
            ),
            // icon:
            title: Text('Motificarions'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.dog,
            ),
            title: Text('Dogs'),
          ),
        ]);
  }
}

class ButtonFloating extends StatelessWidget {
  const ButtonFloating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.red,
    );
  }
}
