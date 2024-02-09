import 'package:flutter/material.dart';

class ProviderTheme extends ChangeNotifier {
  ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey[600],
      cardColor: Colors.blueGrey[500],
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color?>(Colors.blueGrey[500]))),
      iconTheme: IconThemeData(color: Colors.blueGrey[800]),
      splashColor: Colors.black,
      dividerColor: Colors.blueGrey[400]);
  ThemeData light = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blueGrey[400],
      cardColor: Colors.blueGrey[300],
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color?>(Colors.blueGrey[300]))),
      iconTheme: IconThemeData(
        color: Colors.blueGrey[600],
      ),
      splashColor: Colors.white,
      dividerColor: Colors.blueGrey[200]);
  bool toggle = false;

  void toggleTheme(bool newValue) {
    toggle = newValue;

    notifyListeners();
  }
}
