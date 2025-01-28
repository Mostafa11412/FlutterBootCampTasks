import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageTriggerButton extends StatefulWidget {
  const LanguageTriggerButton({super.key});

  @override
  State<LanguageTriggerButton> createState() => _LanguageTriggerButtonState();
}

class _LanguageTriggerButtonState extends State<LanguageTriggerButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Display the Language based on the current Language
        Text(tr("Language"),
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20)),
        // Toggle switch for changing Language
        Switch(
          value: context.locale == const Locale('ar', 'EG'),
          onChanged: (value) {
            // Change Language Based on Current Language.
            setState(() {
              if (context.locale == const Locale('ar', 'EG')) {
                context.setLocale(const Locale('en', 'US'));
              } else {
                context.setLocale(const Locale('ar', 'EG'));
              }
            });
          },
          activeColor: Colors.black,
        )
      ],
    );
  }
}
