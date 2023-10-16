import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/text_hepler.dart';
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
          const Divider(thickness: 2,),
          24.sbH,

        ],
      ),
    );
  }
}
