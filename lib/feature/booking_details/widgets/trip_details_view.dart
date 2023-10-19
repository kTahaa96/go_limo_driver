import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/booking_details/widgets/addresses_details_widget.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

import 'label_value_view.dart';

class TripDetailsView extends StatelessWidget {
  final VoidCallback onBtnTap;
  final int orderStatus;

  final bool isAirportTrip;

  const TripDetailsView(
      {super.key, required this.onBtnTap, required this.isAirportTrip, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelValueView(
                      label: 'الخدمة',
                      value: 'سفر - ذهاب ',
                    ),
                    14.sbH,
                    LabelValueView(
                      label: 'ميعاد السفر',
                      value: DateTime.now().toDateFormat(format: ' d MMM - hh:mm a'),
                    ),
                  ],
                ),
                80.sbW,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelValueView(
                      label: 'سيارة #62',
                      value: 'مرسيدس S 2023',
                    ),
                    14.sbH,
                    const LabelValueView(
                      label: 'طريقة الدفع',
                      value: 'مدفوع مقدما',
                    )
                  ],
                ),
              ],
            ),
            14.sbH,
            isAirportTrip
                ? Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LabelValueView(
                            label: 'مبني وصول',
                            value: 'صالة وصول ١',
                            isAirport: true,
                          ),
                          14.sbH,
                          const LabelValueView(
                            label: 'وصول من ',
                            value: 'دبي',
                            isAirport: true,
                          ),
                        ],
                      ),
                      80.sbW,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LabelValueView(
                            label: 'خط الطيران',
                            value: 'Emirates Airline',
                            isAirport: true,
                          ),
                          14.sbH,
                          const LabelValueView(
                            label: 'رمز الطائرة',
                            value: 'MS516',
                            isAirport: true,
                          )
                        ],
                      ),
                    ],
                  )
                : const SizedBox(),
            14.sbH,
            isAirportTrip == true
                ? const LabelValueView(
                    label: 'نوع الاستقبال',
                    value: 'استقبال خاص',
                    isAirport: true,
                  )
                : const SizedBox(),
            24.sbH,
            const Divider(thickness: 2),
            10.sbH,
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
            const AddressDetails(),
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
                : Row(
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
          ],
        ));
  }
}
