import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class RewardsSingleItem extends StatelessWidget {
  const RewardsSingleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/svg_icons/arrow_in.svg', width: 28.w, height: 28),
              8.sbW,
              const AppText('صرف حوافز'),
            ],
          ),
          Column(
            children: [
              AppText(
                '+90 EGP',
                size: 12,
                color: AppColors.kGreen,
                weight: FontWeight.w400,
              ),
              4.sbH,
              AppText(
                ' ${DateTime.now().toDateFormat()}',
                size: 10,
                color: AppColors.kGrayText,
                weight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
