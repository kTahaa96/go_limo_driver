import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/booking_details/confirm_fuel_setting_screen.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class PassengerView extends StatelessWidget {
  final VoidCallback onBtnTap;
  final int orderStatus;

  const PassengerView({super.key, required this.onBtnTap, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'الأسم',
            size: 13.sp,
            weight: FontWeight.w400,
          ),
          AppText(
            'محمد أحمد',
            size: 14.sp,
            weight: FontWeight.w600,
          ),
          14.sbH,
          AppText(
            'رقم المحمول',
            size: 13.sp,
            weight: FontWeight.w400,
          ),
          AppText(
            '0108742112',
            size: 14.sp,
            weight: FontWeight.w600,
          ),
          42.sbH,
          orderStatus == 0
              ? CustomButton(
            buttonText: 'تأكيد إستلام أمر الشغل',
            onBtnTap: onBtnTap,
            icon: const Icon(
              Icons.add_circle_rounded,
              color: AppColors.kWhite,
            ),
          )
              : orderStatus == 1
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.access_time_rounded,
                color: AppColors.kGreen,
              ),
              5.sbW,
              AppText(
                'الرحلة ستبدأ في خلال 3:20 ساعة',
                color: AppColors.kGreen,
                size: 15.sp,
                weight: FontWeight.w600,
              ),
            ],
          )
              : CustomButton(
            color: AppColors.kGreen,
            buttonText: 'ابدأ الرحلة',
            width: 220.w,
            onBtnTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConfirmFuelSetting()));
            },
            icon: const Icon(
              Icons.check_circle_rounded,
              color: Color(0xffBDFF00),
            ),
          )
        ],
      ),
    );
  }
}
