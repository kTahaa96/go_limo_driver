import 'package:flutter/material.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class StopCarDialog extends StatelessWidget {
  const StopCarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.sbH,

        const AppText(
          'هل السيارة متوقفة؟',
          size: 20,
          weight: FontWeight.w600,
        ),
        12.sbH,
        const AppText(
          'حرصاً علي السلامة يجب توقف السيارة قبل البدء في طلب المساعدة',
          size: 14,
          centerText: true,
          weight: FontWeight.w500,
          color: AppColors.kGrayText,
        ),
        24.sbH,

      ],
    );
  }
}
