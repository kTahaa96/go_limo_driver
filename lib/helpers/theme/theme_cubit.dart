// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:golimo_driver/helpers/theme/theme_handler.dart';
//
// enum AppTheme { light, dark }
// class ThemeCubit extends Cubit<AppTheme> {
//   late AnimationController animationController;
//
//   ThemeCubit() : super(AppTheme.light) {
//     final vsync = BlocProvider.of<ThemeProvider>(this).vsync;
//     animationController = AnimationController(
//       vsync: vsync,
//       duration: const Duration(milliseconds: 500),
//     );
//   }
//
//   void toggleTheme() {
//     if (state == AppTheme.light) {
//       animationController.reverse();
//       emit(AppTheme.dark);
//     } else {
//       animationController.forward();
//       emit(AppTheme.light);
//     }
//   }
//
//   @override
//   Future<void> close() {
//     animationController.dispose();
//     return super.close();
//   }
// }