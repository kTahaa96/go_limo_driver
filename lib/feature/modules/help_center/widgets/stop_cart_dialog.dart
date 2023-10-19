import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/bottom_sheet_helper.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

import 'enter_text_view.dart';

class StopCarDialog extends StatelessWidget {
  const StopCarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      // width: 400.sw,
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: [
                Icon(
                  Icons.close,
                  color: AppColors.kLightGray,
                  size: 20.h,
                )
              ],
            ),
          ),
          30.sbH,
          AppText(
            'هل السيارة متوقفة؟',
            size: 20,
            weight: FontWeight.w600,
          ),
          12.sbH,
          AppText(
            'حرصاً علي السلامة يجب توقف السيارة قبل البدء في طلب المساعدة',
            size: 14,
            centerText: true,
            weight: FontWeight.w500,
            color: AppColors.kGrayText,
          ),
          38.sbH,
          CustomButton(
            buttonText: 'نعم السيارة متوقفة',
            onBtnTap: () => _showBottomSheet(context),
          ),
          32.sbH,
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Center(
                child: AppText(
              'لا السيارة تتحرك',
              color: AppColors.kPrimary,
            )),
          ),
        ],
      ),
    );
  }

  Future<void> _showBottomSheet(BuildContext context) async {
    Navigator.pop(context);
    Future.delayed(Duration(microseconds: 300), () {
      BottomSheetHelper.gShowModalBottomSheet(
        maxHeight: 330.h,
          context: context, content: const EnterConflictWithCustomerView());
    });
  }
}
