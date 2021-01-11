import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0.0;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }
}
