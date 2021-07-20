import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications Pages'),
          backgroundColor: Colors.red,
        ),
        floatingActionButton: const ButtonFloating(),
        bottomNavigationBar: const ButtonMavigation(),
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
          const BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.bone,
            ),
            label: 'Bone',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const FaIcon(
                  FontAwesomeIcons.bell,
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: BounceInDown(
                    from: 15,
                    animate: (numNotifications > 0) ? true : false,
                    child: Bounce(
                      from: 15,
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(
                        context,
                      ).bounceController = controller,
                      child: Container(
                        child: Text(
                          '$numNotifications',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 7.0),
                        ),
                        alignment: Alignment.center,
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // icon:
            label: 'Motifications',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.dog,
            ),
            label: 'Dogs',
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
        final provideCustom = Provider.of<_NotificationModel>(
          context,
          listen: false,
        );

        int numNotifications = provideCustom.num;

        numNotifications++;

        provideCustom.num = numNotifications;

        if (numNotifications >= 2) {
          final controller = provideCustom.bounceController;
          controller.forward(from: 0.0); //inicie en el punto inicial
        }
      },
      child: const FaIcon(
        FontAwesomeIcons.play,
      ),
      backgroundColor: Colors.red,
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _num = 0;
  late AnimationController _bounceController;
  int get num => _num;
  set num(int value) {
    _num = value;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;
  set bounceController(AnimationController value) {
    _bounceController = value;
    notifyListeners();
  }
}
