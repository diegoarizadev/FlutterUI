import 'package:custompainter/src/pages/launcher.dart';
import 'package:custompainter/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeChanger(
            2), //el parametro del contructor, se almacena en las preferencias y se consulta para enviarlo en este constructor.
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).CurrentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LauncherPage(), //SlideShowCustomPage(),
    );
  }
}
