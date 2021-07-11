import 'package:animate/src/pages/pages0ne.dart';
import 'package:animate/src/pages/twitter_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: TwitterPage(), //Page0ne(),
    );
  }
}
