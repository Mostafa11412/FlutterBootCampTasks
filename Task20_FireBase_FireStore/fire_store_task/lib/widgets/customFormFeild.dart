// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// typedef for taking Validator function as parameter.
typedef Validator = String? Function(String?);

class CustomFormFeild extends StatelessWidget {
  String? title;
  String? hint;

  // Optional suffix icon.
  IconButton? suffixIcon;

  // TextEditingController to manage the input value.
  TextEditingController? controller;

  // Type of keyboard
  TextInputType? keyboardType;

  // Boolean to determine if the text should be obscured or not.
  bool isObscured;

  // Validator function to validate the form field.
  Validator? validator;

  CustomFormFeild({
    super.key,
    this.title,
    this.controller,
    this.keyboardType,
    this.isObscured = false,
    this.hint,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title of the form field.
        Text(
          title ?? "Title",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
        ),
        const SizedBox(
          height: 5,
        ),
        // The TextFormField widget that handles user input.
        TextFormField(
          controller: controller,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 18, color: Colors.blue),
          keyboardType: keyboardType,
          validator: validator,
          obscureText: isObscured,
          decoration: InputDecoration(
            errorStyle: const TextStyle(
                fontSize: 15,
                color: Colors.red), // validator Error message style.
            counterText: '', // Hides the character counter.
            hintStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 18, color: Colors.blue),
            hintText: hint ?? "",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        )
      ],
    );
  }
}
