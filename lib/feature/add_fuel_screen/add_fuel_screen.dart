import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/app_bar_row.dart';
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            32.sbH,
            AppBarRow(label: 'الوقود'),
            16.sbH,
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
