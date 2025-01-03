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
    return ElevatedButton(
        //button to trigger between two languages
        onPressed: () {
          //check current locale and change to the other.
          if (context.locale == Locale('ar', 'EG')) {
            context.setLocale(Locale('en', 'US'));
          } else {
            context.setLocale(Locale('ar', 'EG'));
          }
          setState(() {});
        },
        child: Text(tr("changeLanguage")));
  }
}
