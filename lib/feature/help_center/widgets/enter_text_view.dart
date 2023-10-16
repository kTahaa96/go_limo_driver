import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class EnterConflictWithCustomerView extends StatelessWidget {
  const EnterConflictWithCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText('أكتب المشكلة مع العميل', size: 24.sp),
          17.sbH,
          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
                hintText: 'أكتب هنا|',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.kBlack,
                ),
                filled: true,
                fillColor: AppColors.kLightGray,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kLightGray),
                  borderRadius: BorderRadius.circular(8),
                )),
          ),
          20.sbH,
          Column(
            children: [
              CustomButton(
                  buttonText: 'تمام',
                  onBtnTap: () {
                    NamedNavigatorImpl.pop();
                  }),
              CustomButton(
                buttonText: 'الغاء',
                onBtnTap: () {
                  NamedNavigatorImpl.pop();
                },
                textColor: AppColors.kRed,
                borderColor: AppColors.kWhite,
                color: AppColors.kWhite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
