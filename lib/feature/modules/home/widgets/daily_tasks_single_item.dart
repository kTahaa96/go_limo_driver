import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/booking_details/booking_details_screen.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';


class DailyTaskHomePageRow extends StatelessWidget {
  const DailyTaskHomePageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TripOrder()));
      },
      child: Container(
        padding: EdgeInsets.all(16.h),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(
            color: AppColors.kPrimaryBackground.withOpacity(0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.kBlack.withOpacity(0.1),
              blurRadius: 10.r,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
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
            Divider(color: AppColors.kLightGray),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg_icons/user_icon.svg',
                  width: 20,
                  height: 20,
                ),
                4.sbW,
                AppText(
                  "محمد احمداحمد محمود عبد السلام",
                  size: 14.sp,
                  color: AppColors.kDarkGreyText,
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
