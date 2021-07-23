import 'package:custompainter/src/pages/launcher.dart';
import 'package:custompainter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (_) => ThemeChanger(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LauncherPage(), //SlideShowCustomPage(),
    );
  }
}
