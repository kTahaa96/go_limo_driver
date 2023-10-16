import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class AfterAddFuel extends StatelessWidget {
  final VoidCallback onTapConfirm;

  const AfterAddFuel({super.key, required this.onTapConfirm});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        47.sbH,
        SvgPicture.asset(
          'assets/svg_icons/add_fuel.svg',
          width: 124.w,
          height: 76.h,
        ),
        20.sbH,
        AppText(
          'قم بتصوير عداد الوقود بعد التزويد بوضوح',
          size: 13,
          color: AppColors.kGrayText,
          weight: FontWeight.w500,
        ),
        16.sbH,
        Image.asset(
          'assets/png_images/fuel_screen_image.png',
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
                  'إدخل الكيلومترات المتبقية',
                  size: 14,
                  color: AppColors.kBlack,
                  weight: FontWeight.w600,
                ),
                16.sbH,
                Container(
                  width: 205.w,
                  decoration: BoxDecoration(
                      color: Color(0xffF5F5F5), borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ],
        ),
        47.sbH,
        CustomButton(buttonText: 'تأكيد عداد الكيلومترات', onBtnTap: onTapConfirm)
      ],
    );
  }
}
