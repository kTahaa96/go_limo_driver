import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class StopReasonsView extends StatelessWidget {
  final Function(String) onReasonSelect;

  const StopReasonsView({super.key, required this.onReasonSelect});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      children: [
        AppText(
          'سبب توقف السيارة',
          size: 24.w,
          weight: FontWeight.w600,
        ),
        16.sbH,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              CustomButton(
                buttonText: 'اشارة زحمة',
                onBtnTap: () => onReasonSelect('اشارة اة زحمة'),
              ),
              16.sbH,
              CustomButton(
                buttonText: 'عطل في السيارة',
                onBtnTap: () => onReasonSelect('عطل في السيارة'),

              ),
              16.sbH,
              CustomButton(
                buttonText: 'سبب اخر',
                onBtnTap: () => onReasonSelect('سبب اخر'),
                borderColor: AppColors.kBlack,
                color: AppColors.kWhite,
                textColor: AppColors.kBlack,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
