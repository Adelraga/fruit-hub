import 'package:flutter/cupertino.dart';
import 'package:fruit_market_app/core/services/dark_theme.dart';



class DarkThemeProvider with ChangeNotifier {
 ThemeColor themeColor =ThemeColor();
   bool _darkTheme = false;
   bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
   ThemeColor.setDarkTheme(value);
    notifyListeners();
  }
}   