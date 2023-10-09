import 'package:flutter/material.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AppText('RewardsScreen', color: AppColors.kPrimary),
      ),
    );
  }
}
