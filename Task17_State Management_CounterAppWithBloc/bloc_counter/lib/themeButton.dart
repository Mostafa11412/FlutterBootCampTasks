import 'package:bloc_counter/blocs/theme_bloc/theme_bloc.dart';
import 'package:bloc_counter/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Themebutton extends StatefulWidget {
  const Themebutton({super.key});

  @override
  State<Themebutton> createState() => _ThemebuttonState();
}

class _ThemebuttonState extends State<Themebutton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Row(
          children: [
            // Display the icon based on the current theme
            state.currentTheme == ThemeManager.lightTheme
                ? Icon(
                    Icons.dark_mode,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.light_mode,
                    color: Colors.white,
                  ),
            // Toggle switch for changing themes
            Switch(
              value: state.currentTheme == ThemeManager.darkTheme,
              onChanged: (value) {
                // Add the ChangeTheme event to switch themes
                context.read<ThemeBloc>().add(ChangeTheme());
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
            )
          ],
        );
      },
    );
  }
}
