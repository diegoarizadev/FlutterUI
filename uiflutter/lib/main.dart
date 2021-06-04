import 'package:flutter/material.dart';
import 'package:uiflutter/screens/basic_desing.dart';
import 'package:uiflutter/screens/home_desing.dart';
import 'package:uiflutter/screens/scroll_desing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home_design',
      routes: {
        'basic_design': (_) => BasicDesignScreen(),
        'scroll_design': (_) => ScrollDesignScreen(),
        'home_design': (_) => HomeDesingScreen()
      },
    );
  }
}
