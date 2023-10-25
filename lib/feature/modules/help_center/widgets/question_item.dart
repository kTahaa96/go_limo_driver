import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/modules/help_center/widgets/enter_text_view.dart';
import 'package:golimo_driver/feature/modules/help_center/widgets/stop_cart_dialog.dart';
import 'package:golimo_driver/helpers/ui_helpers/bottom_sheet_helper.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';
import 'package:golimo_driver/helpers/ui_helpers/popup_helper.dart';

class QuestionRowItem extends StatelessWidget {
  final int index;

  const QuestionRowItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PopupHelper.gShowDialog(
            context: context,
            barrierDismissible: false,
            content: const StopCarDialog(),
            title: 'هل السيارة متوقفة؟',
            canselText: 'السيارة تتحرك',
            confirmText: 'نعم السيارة متوقفة',
            onConfirm: () {
              Navigator.pop(context);
              Future.delayed(const Duration(microseconds: 300), () {
                BottomSheetHelper.gShowModalBottomSheet(
                    maxHeight: 350.h,
                    context: context,
                    content: const EnterConflictWithCustomerView());
              });
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    width: 28.w,
                    height: 28.h,
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: Color(0xffDC9CEC).withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg_icons/question_notification.svg',
                    )),
                4.sbW,
                buildText(index),
              ],
            ),
            Container(
                width: 24.w,
                height: 24.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffDC9CEC).withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.kPrimary,
                  size: 20.w,
                )),
          ],
        ),
      ),
    );
  }

  Widget buildText(int index) {
    return AppText(
      index == 0
          ? 'هل تواجه مشكلة مع عميل؟'
          : index == 1
              ? 'هل لديك شكوي؟'
              : index == 2
                  ? 'هل تريد ترك تعليق ما؟'
                  : 'ترك رسالة أخري',
      weight: FontWeight.w600,
      size: 13.sp,
    );
  }
}
