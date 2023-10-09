import 'package:flutter/material.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class FuelScreen extends StatelessWidget {
  const FuelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AppText('FuelScreen', color: AppColors.kPrimary),
      ),
    );
  }
}
