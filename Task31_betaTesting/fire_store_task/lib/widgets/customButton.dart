import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String buttonTitle;
  Color? buttonColor;
  TextStyle? textStyle;
  void Function()
      onPressed; // Function to be executed when the button is pressed.

  CustomButton(
      {super.key,
      required this.buttonTitle,
      required this.onPressed,
      this.buttonColor,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ElevatedButton(
          // When the button is pressed, the onPressed callback is called.
          onPressed: onPressed,
          // Button style is customized using ElevatedButton.styleFrom.
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor ?? Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Text(
            buttonTitle,
            style: textStyle ??
                Theme.of(context)
                    .textTheme
                    .titleLarge, // Uses a custom textStyle or defaults to the theme's titleLarge initialized in main.
          )),
    );
  }
}
