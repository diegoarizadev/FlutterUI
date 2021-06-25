import 'package:custompainter/src/pages/circular_progress_page.dart';
import 'package:custompainter/src/reto/cuadrado_animado.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: CircularProgressCustom(),
    );
  }
}
