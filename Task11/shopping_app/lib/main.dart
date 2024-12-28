import 'package:flutter/material.dart';
import 'package:shopping_app/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
      )),
      home: HomePage(),
    );
  }
}
