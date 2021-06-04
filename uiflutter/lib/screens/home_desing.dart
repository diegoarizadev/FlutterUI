import 'package:flutter/material.dart';
import 'package:uiflutter/widgets/background.dart';

class HomeDesingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [Background()],
    ));
  }
}
