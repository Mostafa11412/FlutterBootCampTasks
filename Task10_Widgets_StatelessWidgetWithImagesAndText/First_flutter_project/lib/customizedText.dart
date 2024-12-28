import 'package:flutter/material.dart';

class CustomizedText extends StatelessWidget {
  const CustomizedText({super.key});

  @override
  Widget build(BuildContext context) {
    //text with customized text style.
    return Text("The two images are displayed",
        style: TextStyle(
            //used font Family installed in project assets and in pubsec yaml file.
            fontFamily: "Suwannaphum",
            //customizing text color, size and weight.
            fontWeight: FontWeight.bold,
            color: Colors.green,
            fontSize: 20));
  }
}
