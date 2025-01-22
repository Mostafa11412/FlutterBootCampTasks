// ignore_for_file: must_be_immutable

part of 'theme_bloc.dart';

// State class for the ThemeBloc has a current theme as initial theme.
@immutable
class ThemeState {
  ThemeData currentTheme;
  ThemeState({required this.currentTheme});
}
