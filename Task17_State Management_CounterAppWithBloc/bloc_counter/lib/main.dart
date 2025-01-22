import 'package:bloc_counter/blocs/theme_bloc/theme_bloc.dart';
import 'package:bloc_counter/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// Initializes the ThemeBloc and sets up MaterialApp
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide the ThemeBloc
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            // Set the current theme based on the state
            theme: state.currentTheme,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
