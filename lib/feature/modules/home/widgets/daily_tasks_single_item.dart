import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class DailyTaskHomePageRow extends StatelessWidget {
  const DailyTaskHomePageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration:
          BoxDecoration(color: AppColors.kBottomNavColor, borderRadius: BorderRadius.circular(7.r)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'سفر من الاسكندرية',
                    size: 14.sp,
                    weight: FontWeight.w400,
                  ),
                  8.sbH,
                  AppText(
                    DateTime.now().toDateFormat(format: 'hh:mm a'),
                    size: 16.sp,
                    color: AppColors.kDarkGray,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'بداية الرحلة من ',
                    size: 14.sp,
                    weight: FontWeight.w400,
                  ),
                  8.sbH,
                  AppText(
                    "التجمع الاول",
                    size: 18.sp,
                    color: AppColors.kDarkGreyText,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
          Divider(color: AppColors.kPrimary),
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg_icons/user_icon.svg',
                width: 20,
                height: 20,
              ),
              4.sbW,
              AppText(
                "محمد احمد",
                size: 14.sp,
                color: AppColors.kDarkGreyText,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
