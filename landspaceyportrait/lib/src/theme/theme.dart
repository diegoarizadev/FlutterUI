import 'package:flutter/material.dart';
//Modelo responsable de manejar o administrar el tema de le App.

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  late ThemeData _currentTheme;

  bool get Darktheme => this._darkTheme;
  bool get Customtheme => this._customTheme;
  ThemeData get CurrentTheme => this._currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //Light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2: //Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
                secondary: Colors.pink)); //customizar el thema.
        break;
      case 3: //Theme Custom
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set Darktheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          colorScheme:
              ColorScheme.dark(secondary: Colors.pink)); //customizar el thema.
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set Customtheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            secondary: Colors.pink,
          ),
          secondaryHeaderColor: const Color(0xff48A0EB),
          primaryColor: Colors.white,
          scaffoldBackgroundColor:
              const Color(0xff16202b)); //customizar el thema.

    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}

//appTheme.secondaryHeaderColor
