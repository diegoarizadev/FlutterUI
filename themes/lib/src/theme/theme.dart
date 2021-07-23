import 'package:flutter/material.dart';
//Modelo responsable de manejar o administrar el tema de le App.

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  bool get Darktheme => this._darkTheme;
  bool get Customtheme => this._customTheme;

  set Darktheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    notifyListeners();
  }

  set Customtheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    notifyListeners();
  }
}
