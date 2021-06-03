import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: columnCustom());
  }
}

class columnCustom extends StatelessWidget {
  const columnCustom({
    Key? key,
  }) : super(key: key); //Hace referencia al Widget.

  @override
  Widget build(BuildContext context) {
    //El build realiza las tareas de redibujado.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('data1'), Text('data2')],
    );
  }
}
