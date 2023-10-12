import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/modules/home/cubit/home_cubit.dart';
import 'package:golimo_driver/feature/modules/home/widgets/daily_tasks_single_item.dart';
import 'package:golimo_driver/feature/modules/home/widgets/notification_item.dart';
import 'package:golimo_driver/helpers/di/di.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.of(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      color: AppColors.kPrimaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18.r),
                        bottomRight: Radius.circular(18.r),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      32.sbH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg_icons/driver_icon.svg',
                                width: 30.w,
                                height: 30.h,
                              ),
                              8.sbW,
                              AppText(
                                'اهلا اسامة',
                                color: AppColors.kWhite,
                                size: 15.sp,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg_icons/doughnut_chart.svg',
                                width: 24.w,
                                height: 24.h,
                              ),
                              8.sbW,
                              SvgPicture.asset(
                                'assets/svg_icons/home_notificatoin.svg',
                                width: 24.w,
                                height: 24.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                      16.sbH,
                      AppText(
                        'اوامر شغل اليوم',
                        size: 14.sp,
                        weight: FontWeight.w500,
                        color: AppColors.kWhite,
                      ),
                      8.sbH,
                      Column(
                        children: [
                          const DailyTaskHomePageRow(),
                          12.sbH,
                          const DailyTaskHomePageRow(),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: const Row(
                    children: [
                      AppText('تنبيهات مهمة', color: AppColors.kGrayText),
                    ],
                  ),
                ),
                ListView.separated(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NotificationItem(
                        model: cubit.notificationList[index],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: cubit.notificationList.length)
              ],
            ),
          );
        },
      ),
    );
  }
}
