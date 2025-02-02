import 'package:device_info_task/device_info_manager.dart';
import 'package:device_info_task/home_screen.dart';
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
      theme: ThemeData(textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 22,fontWeight: FontWeight.w500))),
      home: HomePage(),
    );
  }
}
