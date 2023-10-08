import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS == true
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(
              color: AppColors.kPrimary,
            ),
    );
  }
}
