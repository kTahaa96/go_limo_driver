import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/helpers/theme/theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.light());

  void toggleTheme() {
    GolimoTheme theme = GolimoTheme('ar') ;
    if (state == ThemeData.light()) {
      emit(theme.gLightThemeData);
    } else {
      emit(ThemeData.light());
    }
  }
}
