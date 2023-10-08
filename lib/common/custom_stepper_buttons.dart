import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class CustomStepperButtons extends StatelessWidget {
  final VoidCallback onClickNext;
  final VoidCallback onClickCancel;

  const CustomStepperButtons({super.key, required this.onClickNext, required this.onClickCancel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Row(
        children: [
          TextButton(
            onPressed: () => onClickNext(),
            child: AppText(
              'Next',
              weight: FontWeight.w500,
              size: 17.sp,
              color: AppColors.kGrayText,
            ),
          ),
          16.sbW,
          TextButton(
            onPressed: () => onClickCancel(),
            child: AppText(
              'Cansel',
              weight: FontWeight.w500,
              size: 16.sp,
              color: AppColors.kDarkGreyText,
            ),
          )
        ],
      ),
    );
  }
}
