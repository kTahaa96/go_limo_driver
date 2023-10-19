import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class DotedContainer extends StatelessWidget {
  const DotedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 12.w,
          height: 12.h,
          decoration: const BoxDecoration(
            color: AppColors.kGreen,
            shape: BoxShape.circle,
          ),
        ),
        Column(
          children: [
            4.sbH,
            Container(
              width: 2.w,
              height: 6.h,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              color: AppColors.kLightGray,
            ),
            Container(
              width: 2.w,
              height: 6.h,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              color: AppColors.kLightGray,
            ),
            Container(
              width: 2.w,
              height: 6.h,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              color: AppColors.kLightGray,
            ),
            Container(
              width: 2.w,
              height: 6.h,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              color: AppColors.kLightGray,
            ),
            Container(
              width: 2.w,
              height: 6.h,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              color: AppColors.kLightGray,
            ),
            4.sbH,
          ],
        ),
        SvgPicture.asset(
          'assets/svg_icons/location_pin.svg',
          width: 14.w,
          height: 19.h,
        ),
      ],
    );
  }
}
