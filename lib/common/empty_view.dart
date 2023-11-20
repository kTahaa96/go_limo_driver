import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class EmptyView extends StatelessWidget {
  final String text;
final Color? color ;
  final VoidCallback onRefresh;

  const EmptyView({super.key, required this.text, required this.onRefresh, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           AppText(
            text,
             color:color?? AppColors.kLightGray,
          ),
          18.sbH,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               AppText(
                'تحديث',
                color:color?? AppColors.kLightGray,
              ),
              4.sbW,
               Icon(
                Icons.refresh,
                 color:color?? AppColors.kLightGray,
                size: 16,
              )
            ],
          ),
        ],
      ),
    );
  }
}
