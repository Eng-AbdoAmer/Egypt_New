import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkmode => themeMode == ThemeMode.dark;
  void changeTheme(bool iSon) {
    themeMode = iSon ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  static final darkTheme = ThemeData(
      appBarTheme: AppBarTheme(color: Colors.deepOrange),
      brightness: Brightness.dark,
      primarySwatch: Colors.deepOrange,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        unselectedItemColor: Colors.grey.shade600,
        unselectedLabelStyle: TextStyle(color: Colors.grey.shade600),
        backgroundColor: Colors.deepOrange,
        selectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(
            color: Colors.grey.shade900, size: 25.0, opacity: 10.0),
        selectedLabelStyle: TextStyle(color: Colors.white),
        selectedIconTheme:
            IconThemeData(color: Colors.white, size: 25.0, opacity: 10.0),
      ));

  static final LightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    brightness: Brightness.light,
    accentColor: Colors.green,
    primarySwatch: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.green.shade500),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      unselectedItemColor: Colors.grey.shade600,
      unselectedLabelStyle: TextStyle(color: Colors.grey.shade600),
      backgroundColor: Colors.green,
      selectedItemColor: Colors.white,
      unselectedIconTheme:
          IconThemeData(color: Colors.grey.shade900, size: 25.0, opacity: 10.0),
      selectedLabelStyle: TextStyle(color: Colors.white),
      selectedIconTheme:
          IconThemeData(color: Colors.white, size: 25.0, opacity: 10.0),
    ),
  );

  int CurrentIndex = 0;
  ChangeCurrentIndex(int i) {
    CurrentIndex = i;
    notifyListeners();
  }
}
