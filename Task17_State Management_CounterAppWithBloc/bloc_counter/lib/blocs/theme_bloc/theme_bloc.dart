import 'package:bloc/bloc.dart';
import 'package:bloc_counter/theme_manager.dart';
import 'package:flutter/material.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  // Initial state with the light theme
  ThemeBloc() : super(ThemeState(currentTheme: ThemeManager.lightTheme)) {
    on<ThemeEvent>((event, emit) {
      // Toggle between light and dark themes
      emit(ThemeState(
          currentTheme: state.currentTheme == ThemeManager.lightTheme
              ? ThemeManager.darkTheme
              : ThemeManager.lightTheme));
    });
  }
}
