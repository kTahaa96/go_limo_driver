import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/add_fuel_screen/widgets/after_add_fuel.dart';
import 'package:golimo_driver/feature/add_fuel_screen/widgets/befor_add.dart';
import 'package:golimo_driver/feature/add_fuel_screen/widgets/fuel_recipt_view.dart';
import 'package:golimo_driver/feature/add_fuel_screen/widgets/stepper_item.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class AddFullScreen extends StatefulWidget {
  const AddFullScreen({super.key});

  @override
  State<AddFullScreen> createState() => _AddFullScreenState();
}

class _AddFullScreenState extends State<AddFullScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
        leading: Container(
          width: 30.w,
          height: 30.h,
          padding: EdgeInsets.only(right: 16.w, left: 8),
          child: SvgPicture.asset(
            'assets/svg_icons/driver_icon.svg',
          ),
        ),
        title: AppText('الوقود' , ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    // cubit.updatePageIndex(newVal: 5);
                  },
                  child: SvgPicture.asset(
                    'assets/svg_icons/doughnut_chart.svg',
                    width: 24.w,
                    height: 24.h,
                    color: AppColors.kBlack,
                  ),
                ),
                8.sbW,
                InkWell(
                  onTap: () {
                    // cubit.updatePageIndex(newVal: 4);
                  },
                  child: SvgPicture.asset(
                    'assets/svg_icons/home_notificatoin.svg',
                    width: 24.w,
                    height: 24.h,
                    color: AppColors.kBlack,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            24.sbH,

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StepperItem(
                  index: 0,
                  isActive: currentIndex == 0 ? true : false,
                  isDone: currentIndex > 0 ? true : false,
                ),
                Container(
                  height: 1.h,
                  width: 52.w,
                  color: AppColors.kLightGray,
                ),
                StepperItem(
                  index: 1,
                  isActive: currentIndex == 1 ? true : false,
                  isDone: currentIndex > 1 ? true : false,
                ),
                Container(
                  height: 1.h,
                  width: 52.w,
                  color: AppColors.kLightGray,
                ),
                StepperItem(
                  index: 2,
                  isActive: currentIndex == 2 ? true : false,
                  isDone: currentIndex > 2 ? true : false,
                ),
              ],
            ),
            48.sbH,
            currentIndex == 0
                ? BeforeAddFuelView(
                    onTapConfirm: () {
                      setState(() => currentIndex++);
                      log('====> ${currentIndex}');
                    },
                  )
                : currentIndex == 1
                    ? AfterAddFuel(
                        onTapConfirm: () {
                          setState(() => currentIndex++);
                          log('====> ${currentIndex}');
                        },
                      )
                    : FinalFuelView(
                        onTapConfirm: () {
                          setState(() => currentIndex++);
                          Navigator.pop(context);
                          log('====> ${currentIndex}');
                        },
                      )
          ],
        ),
      ),
    );
  }
}
