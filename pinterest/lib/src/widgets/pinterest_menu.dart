import 'package:flutter/material.dart';

class PinterestMenu extends StatelessWidget {
  final List items = List.empty();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PinterestButton {
  final Function onPressed;
  final IconData Icon;

  PinterestButton({required this.onPressed, required this.Icon});
}
