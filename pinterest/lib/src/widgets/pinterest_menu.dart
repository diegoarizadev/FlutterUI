import 'package:flutter/material.dart';

class PinterestMenu extends StatelessWidget {
  final List items = List.empty();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PinterestButton {
  final Function() onPressed;
  final IconData Icon;

  PinterestButton({required this.onPressed, required this.Icon});
}

class PinteresMenu extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(
        onPressed: () {
          print('Icons.pie_chart');
        },
        Icon: Icons.pie_chart),
    PinterestButton(
        onPressed: () {
          print('Icons.search');
        },
        Icon: Icons.search),
    PinterestButton(
        onPressed: () {
          print('Icons.notifications');
        },
        Icon: Icons.notifications),
    PinterestButton(
        onPressed: () {
          print('Icons.supervised_user_circle');
        },
        Icon: Icons.supervised_user_circle)
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: _PinterestMenuBackground(
      Child: _MenuItems(
        menuItems: items,
      ),
    ));
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget Child;

  const _PinterestMenuBackground({required this.Child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.Child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(90)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              spreadRadius: -5,
              blurRadius: 10,
            ),
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length,
            (index) => _PinteresMenuButton(
                  index: index,
                  item: menuItems[index],
                )));
  }
}

class _PinteresMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinteresMenuButton({required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onPressed,
      behavior: HitTestBehavior
          .translucent, //Para lagunos dispositivos que no detectan la acción de los botones
      child: Container(
        child: Icon(
          item.Icon,
          size: 28,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
