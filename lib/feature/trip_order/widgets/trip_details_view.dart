import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        'الخدمة',
                        size: 13,
                        weight: FontWeight.w400,
                      ),
                      4.sbH,
                      const AppText(
                        'سفر - ذهاب ',
                        size: 14,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  14.sbH,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        'ميعاد السفر',
                        size: 13,
                        weight: FontWeight.w400,
                      ),
                      4.sbH,
                      AppText(
                        '${DateTime.now().toDateFormat(format: ' d MMM - hh:mm a')}',
                        size: 14,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
              80.sbW,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        'سيارة #62',
                        size: 13,
                        weight: FontWeight.w400,
                      ),
                      4.sbH,
                      const AppText(
                        'مرسيدس S 2023',
                        size: 14,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  14.sbH,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        'طريقة الدفع',
                        size: 13,
                        weight: FontWeight.w400,
                      ),
                      4.sbH,
                      const AppText(
                        'مدفوع مقدماً',
                        size: 14,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          24.sbH,
          const Divider(
            thickness: 2,
          ),
          24.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 24.w,
                    height: 24.h,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimary.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset('assets/svg_icons/operations_active.svg'),
                  ),
                  4.sbW,
                  const AppText(
                    'رحلة الذهاب',
                    size: 14,
                    weight: FontWeight.w600,
                  )
                ],
              ),
              const AppText(
                '10 OCT - 05:00 AM',
                size: 12,
                weight: FontWeight.w600,
              )
            ],
          ),
          8.sbH,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                color: AppColors.kWhite,
                border: Border.all(color: AppColors.kLightGray, width: 2.h),
                borderRadius: BorderRadius.circular(10.w)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                ),
                12.sbW,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      'عنوان بداية الرحلة',
                      size: 12,
                      weight: FontWeight.w600,
                    ),
                    8.sbH,
                    const AppText(
                      '22 Vueta Plaza - El Tagomma El Khames - CAI',
                      size: 12,
                      weight: FontWeight.w400,
                      color: AppColors.kGrayText,
                    ),
                    8.sbH,
                    Container(
                      width: 315.w,
                      height: 1.h,
                      color: AppColors.kLightGray,
                    ),
                    8.sbH,
                    const AppText(
                      'عنوان نهاية الرحلة',
                      size: 12,
                      weight: FontWeight.w600,
                    ),
                    8.sbH,
                    const AppText(
                      '824 Ugguh Boulevard - ALX',
                      size: 12,
                      weight: FontWeight.w400,
                      color: AppColors.kGrayText,
                    ),
                    8.sbH,
                  ],
                )
              ],
            ),
          ),
          80.sbH,

          CustomButton(buttonText: 'تأكيد إستلام أمر الشغل', onBtnTap: () {})

        ],
      ),
    );
  }
}
