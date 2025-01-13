import 'package:api_task2/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
          textTheme: TextTheme(
              bodyLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ))),
    );
  }
}
