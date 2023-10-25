import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class GolimoTheme  {
  final String langCode;

  GolimoTheme(this.langCode);

  ThemeData get gLightThemeData {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.kBackground,
      primaryColor: AppColors.kPrimary,
      brightness: Brightness.light,
      fontFamily: langCode == "ar" ? "Alexandria" : "Alexandria",
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: AppColors.kBlack,
      ),

      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),

      primaryIconTheme: const IconThemeData(color: AppColors.kWhite),
      iconTheme: const IconThemeData(color: AppColors.kBlack),
      primaryTextTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 24,
          height: 1.5,
          color: AppColors.kWhite,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          height: 1.5,
          color: AppColors.kWhite,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          height: 1.5,
          color: AppColors.kWhite,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.5,
          color: AppColors.kWhite,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.5,
          color: AppColors.kWhite,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.5,
          color: AppColors.kWhite,
        ),
      ),

      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 24,
          color: Colors.black,
          height: 1.5,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          color: AppColors.kBlack,
          height: 1.5,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          color: Colors.black,
          height: 1.5,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.black,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.kBlack,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Colors.black,
          height: 1.5,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.kBlack,
      ),
      appBarTheme: const AppBarTheme(elevation: 0 , color: AppColors.kPrimary),
      dividerColor: AppColors.kLightGray,

      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.kWhite, brightness: Brightness.light)
          .copyWith(background: const Color(0xffF3F3F3))
          .copyWith(background: AppColors.kWhite)
          .copyWith(secondary: AppColors.kBackground),
    );
  }
}
