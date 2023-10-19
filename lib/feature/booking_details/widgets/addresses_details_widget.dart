import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

import 'dotted_cotainer.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return           Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          color: AppColors.kWhite,
          border: Border.all(color: AppColors.kLightGray, width: 2.h),
          borderRadius: BorderRadius.circular(10.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DotedContainer(),
          11.sbW,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                'عنوان بداية الرحلة',
                size: 12,
                weight: FontWeight.w600,
              ),
              8.sbH,
              const AppText(
                '22 Vueta Plaza - El Tagomma El Khames - CAI',
                size: 12,
                weight: FontWeight.w400,
                color: AppColors.kGrayText,
              ),
              8.sbH,
              Container(
                width: 315.w,
                height: 1.h,
                color: AppColors.kLightGray,
              ),
              8.sbH,
              const AppText(
                'عنوان نهاية الرحلة',
                size: 12,
                weight: FontWeight.w600,
              ),
              8.sbH,
              const AppText(
                '824 Ugguh Boulevard - ALX',
                size: 12,
                weight: FontWeight.w400,
                color: AppColors.kGrayText,
              ),
              8.sbH,
            ],
          )
        ],
      ),
    )
    ;
  }
}
