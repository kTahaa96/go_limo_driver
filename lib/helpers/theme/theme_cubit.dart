import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/helpers/theme/theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.light());

  static ThemeCubit of(context) => BlocProvider.of(context);

  void toggleTheme() {
    GolimoTheme theme = GolimoTheme('ar');
    if (state == ThemeData.light()) {
      emit(theme.gDarkThemeData);
    } else {
      emit(theme.gLightThemeData);
    }
  }
}
