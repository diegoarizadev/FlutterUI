import 'package:flutter/material.dart';
import 'package:uiflutter/screens/basic_desing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'basic_design',
      routes: {'basic_design': (BuildContext context) => BasicDesignScreen()},
    );
  }
}
