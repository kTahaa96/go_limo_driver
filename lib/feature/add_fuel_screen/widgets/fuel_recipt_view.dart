import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class FinalFuelView extends StatelessWidget {
  final VoidCallback onTapConfirm;

  const FinalFuelView({super.key, required this.onTapConfirm});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        47.sbH,
        SvgPicture.asset(
          'assets/svg_icons/recipt.svg',
          width: 124.w,
          height: 76.h,
        ),
        20.sbH,
        AppText(
          'قم بتصوير الفاتورة بوضوح',
          size: 13,
          color: AppColors.kGrayText,
          weight: FontWeight.w500,
        ),
        16.sbH,
        Image.asset(
          'assets/png_images/recipt.png',
          width: 388.w,
          height: 276.h,
        ),
        33.sbH,
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(
                  'كم لتر وقود',
                  size: 14,
                  color: AppColors.kBlack,
                  weight: FontWeight.w600,
                ),
                16.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 98.w,
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5), borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    16.sbW,
                    Row(
                      children: [
                        Container(
                          width: 130.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36.r),
                              border: Border.all(color: AppColors.kPrimary)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: AppColors.kPrimary,
                                size: 10,
                              ),
                              5.sbW,
                              AppText(
                                'وقود 95',
                                color: AppColors.kPrimary,
                                size: 16.sp,
                                weight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        6.sbW,
                        Container(
                          width: 130.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36.r),
                              border: Border.all(color: AppColors.kLightGray)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                'وقود 95',
                                color: AppColors.kLightGray,
                                size: 16.sp,
                                weight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        47.sbH,
        CustomButton(
            buttonText: 'تأكيد عداد الكيلومترات',
            onBtnTap: () {
              log('asdasdasdasdass');
              onTapConfirm();
            })
      ],
    );
  }
}
