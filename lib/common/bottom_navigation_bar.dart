import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int index) onItemTap;

  const CustomBottomNavigationBar({super.key, required this.currentIndex, required this.onItemTap});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.h,
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 22.h),
      decoration: BoxDecoration(
        color: AppColors.kBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlack.withOpacity(0.1),
            blurRadius: 12.r,
            offset: Offset(0, -2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          bottomNavigationItem(
            index: 0,
            label: 'الرئيسية',
            iconPath: 'assets/svg_icons/home_inactive.svg',
            activeIconPath: 'assets/svg_icons/home_active.svg',
          ),
          bottomNavigationItem(
            index: 1,
            label: 'أوامر الشغل',
            iconPath: 'assets/svg_icons/operations_inactive.svg',
            activeIconPath: 'assets/svg_icons/operations_active.svg',
          ),
          bottomNavigationItem(
            index: 2,
            label: 'الحوافز',
            iconPath: 'assets/svg_icons/rewards_inactive.svg',
            activeIconPath: 'assets/svg_icons/rewards_active.svg',
          ),
          bottomNavigationItem(
            index: 3,
            label: 'الوقود',
            iconPath: 'assets/svg_icons/fuel_inactive.svg',
            activeIconPath: 'assets/svg_icons/fuel_active.svg',
          ),
        ],
      ),
    );
  }

  Widget bottomNavigationItem(
      {required String iconPath,
      required String activeIconPath,
      required String label,
      required int index}) {
    return InkWell(
      onTap: () => widget.onItemTap(index),
      child: Column(
        children: [
          SvgPicture.asset(
            index == widget.currentIndex ? activeIconPath : iconPath,
            width: 24.w,
            height: 24.h,
            color: index == widget.currentIndex ? AppColors.kPrimary : AppColors.kBlack,
          ),
          10.sbH,
          AppText(
            label,
            color: index == widget.currentIndex ? AppColors.kPrimary : AppColors.kBlack,
            size: index == widget.currentIndex ? 13.sp : 12.sp,
          )
        ],
      ),
    );
  }
}
