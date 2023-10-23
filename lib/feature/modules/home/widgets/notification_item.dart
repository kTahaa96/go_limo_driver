import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/core/consts/notification_list.dart';
import 'package:golimo_driver/feature/modules/home/widgets/enter_reason_view.dart';
import 'package:golimo_driver/feature/modules/home/widgets/stop_reason_view.dart';
import 'package:golimo_driver/helpers/ui_helpers/bottom_sheet_helper.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel model;

  const NotificationItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.kPrimary.withOpacity(0.3)),
                  child: buildImg(status: model.status)),
              8.sbW,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    '${model.title}',
                    size: 13.sp,
                    weight: FontWeight.w600,
                    color: AppColors.kBlack,
                  ),
                  5.sbH,
                  SizedBox(
                    width: model.status == 2 || model.status == 3 ? 180.w : 270.w,
                    child: AppText(
                      '${model.desc}',
                      size: 12.sp,
                      maxLines: 1,
                      weight: FontWeight.w400,
                      color: AppColors.kGrayText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              buildButton(model.status, context),
              8.sbW,
              AppText(
                '${model.dateAgo}',
                size: 10.sp,
                weight: FontWeight.w400,
                color: AppColors.kGrayText,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImg({required int status}) {
    return model.status == 5
        ? AppText(
            '30',
            size: 13.sp,
            weight: FontWeight.w700,
            color: AppColors.kPrimary,
          )
        : SvgPicture.asset(
            status == 0
                ? 'assets/svg_icons/car_notification.svg'
                : status == 1
                    ? 'assets/svg_icons/warinig_notification.svg'
                    : status == 2
                        ? 'assets/svg_icons/question_notification.svg'
                        : status == 3
                            ? 'assets/svg_icons/time_notification.svg'
                            : 'assets/svg_icons/check_notification.svg',
            width: 20.sp,
            height: 20.sp,
          );
  }

  Widget buildButton(int status, BuildContext context) {
    return model.status == 2
        ? InkWell(
            onTap: () {
              BottomSheetHelper.gShowModalBottomSheet(
                  context: context,
                  maxHeight: 330,
                  isPaddingAll: true,
                  content: StopReasonsView(
                    onReasonSelect: (reason) {
                      if (reason == 'سبب اخر') {
                        Navigator.pop(context);
                        BottomSheetHelper.gShowModalBottomSheet(
                          context: context,
                          maxHeight: 350,
                          barrierDismissible: true,
                          content: const EnterReasonView(),
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 18.w),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(color: AppColors.kPrimary, borderRadius: BorderRadius.circular(24)),
              child: AppText(
                'ابدء السبب',
                size: 10.sp,
                weight: FontWeight.w600,
                color: AppColors.kWhite,
              ),
            ),
          )
        : model.status == 3
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.kPrimary, borderRadius: BorderRadius.circular(24)),
                child: AppText(
                  'تاكيد التحصيل  ',
                  size: 10.sp,
                  weight: FontWeight.w600,
                  color: AppColors.kWhite,
                ),
              )
            : SizedBox();
  }
}
