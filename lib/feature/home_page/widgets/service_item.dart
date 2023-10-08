import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/core/consts/strings.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_routes.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class ChooseServiceItem extends StatelessWidget {
  final String imagePath;

  final ServiceTypes serviceType;

  const ChooseServiceItem({super.key, required this.imagePath, required this.serviceType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NamedNavigatorImpl.push(Routes.bookTrip, arguments: serviceType);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3.2.w,
        height: 90.h,
        // padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.kBlueBackBackground.withOpacity(0.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              width: imagePath.contains("travel") ? 30.w : 24.w,
              height: imagePath.contains("travel") ? 50.h : 24.h,
              color: AppColors.kWhite,
            ),
            8.sbH,
            AppText(
              serviceType.name,
              color: AppColors.kWhite,
              size: 12.sp,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
