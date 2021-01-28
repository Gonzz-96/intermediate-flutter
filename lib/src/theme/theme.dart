import 'package:flutter/material.dart';

class ThemeChange with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    notifyListeners();
  }
}
