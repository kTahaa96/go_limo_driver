import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/back_icon.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/core/consts/trip_setting_item_model.dart';
import 'package:golimo_driver/feature/booking_details/widgets/booking_step.dart';
import 'package:golimo_driver/feature/booking_details/widgets/check_trip_setting_view.dart';
import 'package:golimo_driver/feature/booking_details/widgets/confirm_fuel_view.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class ConfirmFuelSetting extends StatefulWidget {
  const ConfirmFuelSetting({super.key});

  @override
  State<ConfirmFuelSetting> createState() => _ConfirmFuelSettingState();
}

class _ConfirmFuelSettingState extends State<ConfirmFuelSetting> {
  int currentIndex = 0;

  List<TripSettingItemModel> settingList = [
    TripSettingItemModel(label: 'تم التأكد من توفر ماكينة الدفع بالفيزا', isSelected: false),
    TripSettingItemModel(label: 'تم التأكد من نظافة السيارة من الداخل والخارج', isSelected: false),
    TripSettingItemModel(label: 'تم التأكد من توفر الوقود الكافي للرحلة', isSelected: false),
    TripSettingItemModel(label: 'تم التأكد من رائحة السيارة الطيبة', isSelected: false),
    TripSettingItemModel(label: 'تم التأكد من ضغط الإطارات', isSelected: false),
    TripSettingItemModel(
        label: 'تم التأكد من مظهري اللائق والعناية بملابس العمل', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16.h), children: [
        40.sbH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(color: AppColors.kBackground),
                  width: 44.w,
                  height: 34,
                  child: Image.asset(
                    'assets/png_images/travel.png',
                    width: 38.w,
                    height: 24.h,
                  ),
                ),
                8.sbW,
                Column(
                  children: [
                    AppText(
                      'سفر',
                      size: 14.sp,
                      weight: FontWeight.w500,
                    ),
                    AppText(
                      '#89843',
                      size: 12.sp,
                      weight: FontWeight.w400,
                    )
                  ],
                )
              ],
            ),
            const BackIcon(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 69.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderStepperItem(
                index: 0,
                isActive: currentIndex == 0 ? true : false,
                isDone: currentIndex > 0 ? true : false,
              ),
              Container(
                height: 1.h,
                width: 52.w,
                color: AppColors.kLightGray,
              ),
              OrderStepperItem(
                index: 1,
                isActive: currentIndex == 1 ? true : false,
                isDone: currentIndex > 1 ? true : false,
              ),
            ],
          ),
        ),
        16.sbH,
        currentIndex == 0
            ? ConfirmFuelView(
                onClickDone: () {
                  setState(() {
                    currentIndex++;
                  });
                },
              )
            : CheckTripSettingView(
                callback: () {
                  for (var item in settingList) {
                    if (item.isSelected == false) {
                      log(item.label);
                      break;
                    } else {
                      log('done');
                    }
                  }
                },
                settingList: settingList,
              )
      ]),
    );
  }
}
