import 'package:flutter/material.dart';

class ThemeManager {
  // Define the light theme
  static final ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey[900],
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold))));

  // Define the dark theme
  static final ThemeData darkTheme = ThemeData(
      textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey[900],
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.grey[900],
              textStyle: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 25,
                  fontWeight: FontWeight.bold))));
}
