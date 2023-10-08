import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class EmptyView extends StatelessWidget {
  final String? text;

  const EmptyView({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Icon(
            Icons.hourglass_empty,
            color: AppColors.kLightGray,
            size: 26.w,
          ),
          8.sbH,
          AppText(
            "${text ?? 'No Data Avilable , try another word'}",
            size: 12,
            color: AppColors.kLightGray,
            centerText: true,
          )
        ],
      ),
    );
  }
}
