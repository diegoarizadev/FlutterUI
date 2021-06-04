import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uiflutter/screens/basic_desing.dart';
import 'package:uiflutter/screens/home_desing.dart';
import 'package:uiflutter/screens/scroll_desing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle
        .light); //Cambia el color de los elemtos de la parte superior o barra del S.O

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
