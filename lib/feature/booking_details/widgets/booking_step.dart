import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class OrderStepperItem extends StatelessWidget {
  final int index;

  final bool isActive;
  final bool isDone;

  const OrderStepperItem({super.key, required this.index, required this.isActive, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isDone
            ? Container(
          width: 28.w,
          height: 28.h,
          decoration: BoxDecoration(color: AppColors.kPrimary, shape: BoxShape.circle),
          child: Icon(
            Icons.check,
            color: AppColors.kWhite,
          ),
        )
            : Container(
            width: isActive ? 28.w : 24.w,
            height: isActive ? 28.h : 24.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive ? AppColors.kBlack : AppColors.kLightGray,
                width: isActive ? 5 : 2,
              ),
            )),
        Container(
            width: 90.w,
            margin: EdgeInsets.only(top: 5.h),
            child: AppText(
              index == 0
                  ? 'تسجيل عداد الكيلوترات'
                  : 'تأكيد إعدادات الرحلة',
              size: 11,
              centerText: true,
              color: isActive
                  ? AppColors.kBlack
                  : isDone
                  ? AppColors.kPrimary
                  : AppColors.kLightGray,
              weight: FontWeight.w500,
            )),
      ],
    );
  }
}
