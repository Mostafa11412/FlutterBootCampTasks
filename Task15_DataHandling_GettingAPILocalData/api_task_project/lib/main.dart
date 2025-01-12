import 'package:api_task_project/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ))),
      home: HomePage(),
    );
  }
}
