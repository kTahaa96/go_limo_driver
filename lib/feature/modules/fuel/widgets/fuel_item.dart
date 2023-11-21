import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/core/models/fuel/history_item_model.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class FuelItem extends StatelessWidget {
  final HistoryItem model;

  const FuelItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                  width: 28.w,
                  height: 28.h,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: AppColors.kPrimary.withOpacity(0.5), shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    'assets/svg_icons/fuel_active.svg',
                    color: AppColors.kPrimary,
                  ),
                ),
                8.sbW,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText('${model.amount}0 لتر', size: 14, weight: FontWeight.w600),
                    7.sbH,
                    AppText(
                      '500 جم - بنزين ${model.type == 1 ? "92" : 95}',
                      size: 11,
                      color: AppColors.kGray,
                      weight: FontWeight.w400,
                    )
                  ],
                ),
              ],
            ),
            AppText(
              model.createdAt.toDateFormat(),
              // .toDateFormat(format: 'd MMM yyyy')}'
              size: 10,
              color: AppColors.kGray,
              weight: FontWeight.w300,
            ),
          ],
        ),
        Container(
          height: 1.h,
          color: const Color(0xffDADADA),
          margin: const EdgeInsets.symmetric(vertical: 16),
        )
      ],
    );
  }
}
