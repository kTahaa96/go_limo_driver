import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimary = Color(0xff9E6CAB);
  static const Color kPrimaryBackground = Color(0xff87279F);
  static const Color kBackground = Color(0xfffefbff);
  static const Color kWhite = Color(0xffFFFFFF);
  static const Color kBlack = Color(0xff000000);
  static const Color kGray = Color(0xff777777);
  static const Color kLightGray = Color(0xffC1C9D2);
  static const Color kIndicatorColor = Color(0xff2a2a2a);
  static const Color kDarkGray = Color(0xff7E7E7E);
  static const Color kSplashBgColor = Color(0xff19191A);
  static const Color kRed = Color(0xffE30613);
  static const Color kOrange = Color(0xffFA6400);
  static const Color kGreen = Color(0xff1EB10D);
  static const Color kGrayText = Color(0xff7C7C7C);
  static const Color kDarkGreyText = Color(0xff535353);
  static const Color kBottomNavColor = Color(0xffFEFBFF);
}

extension GetColor on Color {
  static Color getColor({required Color color}) {
    return color;
  }
}
