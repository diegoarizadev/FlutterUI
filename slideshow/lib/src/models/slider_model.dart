import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double currentNewPage) {
    this._currentPage = currentNewPage;
    notifyListeners(); //Notiuficara el cambio a todos los widgets que esten escuchando.
  }
}
