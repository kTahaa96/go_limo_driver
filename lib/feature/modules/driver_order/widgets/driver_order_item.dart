import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/core/models/driver_order_response/driver_trips_item_model.dart';
import 'package:golimo_driver/feature/booking_details/booking_details_screen.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class DailyTaskHomePageItem extends StatelessWidget {
  final TripItemModel model;

  const DailyTaskHomePageItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TripOrder()));
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
              offset: const Offset(0, 2), // changes position of shadow
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width/2.7,
                      child: AppText(
                        'سفر من ${model.dropToFrom}',
                        maxLines: 1,
                        size: 14.sp,
                        withOverFlow: true,
                        weight: FontWeight.w400,
                      ),
                    ),
                    8.sbH,
                    AppText(
                      DateTime.now().toDateFormat(format: 'hh:mm a', locale: "ar"),
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width/2.7,
                      child: AppText(
                        model.pickupFrom,
                        size: 18.sp,
                        withOverFlow: true,
                        maxLines: 1,
                        color: AppColors.kDarkGreyText,
                        weight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(color: AppColors.kLightGray),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg_icons/user_icon.svg',
                  width: 20,
                  height: 20,
                ),
                4.sbW,
                AppText(
                  model.passenger.fullName,
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
