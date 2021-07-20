import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications Pages'),
          backgroundColor: Colors.red,
        ),
        floatingActionButton: ButtonFloating(),
        bottomNavigationBar: ButtonMavigation(),
      ),
    );
  }
}

class ButtonMavigation extends StatelessWidget {
  const ButtonMavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int numNotifications = Provider.of<_NotificationModel>(context).num;
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
                      '$numNotifications',
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
      onPressed: () {
        int numNotifications = Provider.of<_NotificationModel>(
          context,
          listen: false,
        ).num;

        numNotifications++;

        Provider.of<_NotificationModel>(
          context,
          listen: false,
        ).num = numNotifications;
      },
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.red,
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _num = 0;

  int get num => this._num;
  set num(int value) {
    this._num = value;
    notifyListeners();
  }
}
