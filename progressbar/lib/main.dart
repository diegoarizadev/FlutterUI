import 'package:custompainter/src/labs/circular_progress_page.dart';
import 'package:custompainter/src/pages/piecharts.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: PieChartsCustom(),
    );
  }
}
