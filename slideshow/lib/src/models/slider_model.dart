import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double currentNewPage) {
    this._currentPage = currentNewPage;
    notifyListeners(); //Notiuficara el cambio a todos los widgets que esten escuchando.
  }
}

class SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimary = Colors.grey;
  Color _colorSecundary = Colors.red;
  double _bulletPrimary = 12.0;
  double _bulletSecundary = 12.0;

  double get currentPage => this._currentPage;
  Color get colorPrimary => this._colorPrimary;
  Color get colorSecundary => this._colorSecundary;
  double get bulletPrimary => _bulletPrimary;
  double get bulletSecundary => _bulletSecundary;

  set currentPage(double currentNewPage) {
    this._currentPage = currentNewPage;
    notifyListeners(); //Notificara el cambio a todos los widgets que esten escuchando.
  }

  set colorPrimary(Color color) {
    this._colorPrimary = color;
    notifyListeners();
  }

  set colorSecundary(Color color) {
    this._colorSecundary = color;
    notifyListeners();
  }

  set bulletPrimary(double value) {
    this._bulletPrimary = value;
    notifyListeners();
  }

  set bulletSecundary(double value) {
    this._bulletSecundary = value;
    notifyListeners();
  }
}
