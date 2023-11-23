import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/conditional_builder.dart';
import 'package:golimo_driver/common/empty_view.dart';
import 'package:golimo_driver/common/error_widget.dart.dart';
import 'package:golimo_driver/common/loader/app_loader.dart';
import 'package:golimo_driver/common/state_conditional_builder.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/modules/driver_order/widgets/driver_order_item.dart';
import 'package:golimo_driver/feature/modules/home/cubit/home_cubit.dart';
import 'package:golimo_driver/feature/modules/notificatiton_center/widgets/notification_item.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        final cubit = HomeCubit.of(context);
        return StateConditionalBuilder(
          loadingCondition: state is LoadingHomeState,
          errorCondition: state is ErrorHomeState,
          errorBuilder: (context) => const ErrorStateWidget(),
          loadingBuilder: (context) => const AppLoader(),
          fallback: (context) => ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: 320.h,
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    color: AppColors.kPrimaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18.r),
                      bottomRight: Radius.circular(18.r),
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ConditionalBuilder(
                      condition: cubit.onGoingTrips.isNotEmpty,
                      builder: (context) => Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: AppColors.kGreen,
                                size: 12,
                              ),
                              4.sbW,
                              AppText(
                                'رحلة جارية حالياً',
                                size: 14.sp,
                                weight: FontWeight.w500,
                                color: AppColors.kWhite,
                              ),
                            ],
                          ),
                          8.sbH,
                          ListView.builder(
                              itemCount: cubit.todayTrips.length > 2 ? 2 : cubit.todayTrips.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return DailyTaskHomePageItem(model: cubit.todayTrips[index]);
                              }),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg_icons/time_icon.svg',
                              width: 12,
                              height: 12,
                              color: AppColors.kIndicatorColor,
                            ),
                            AppText(
                              'اوامر شغل اليوم',
                              size: 14.sp,
                              weight: FontWeight.w500,
                              color: AppColors.kWhite,
                            ),
                          ],
                        ),
                        8.sbH,
                        ConditionalBuilder(
                          condition: cubit.todayTrips.isEmpty,
                          builder: (context) => EmptyView(
                            text: 'لا توجد اوامر شغل حتي الان',
                            color: AppColors.kWhite,
                            onRefresh: () {},
                          ),
                          fallback: (context) => ListView.builder(
                              itemCount: cubit.todayTrips.length > 2 ? 2 : cubit.todayTrips.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return DailyTaskHomePageItem(model: cubit.todayTrips[index]);
                              }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ConditionalBuilder(
                condition: cubit.notificationList.isEmpty,
                builder: (context) => EmptyView(
                  text: 'لايوجد تنبيهات',
                  color: AppColors.kBlack,
                  onRefresh: () {
                    // cubit.getUpcomingTripsOrder();
                  },
                ),
                fallback: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: const Row(
                        children: [
                          AppText('تنبيهات مهمة', color: AppColors.kGrayText),
                        ],
                      ),
                    ),
                    ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return NotificationItem(
                            model: cubit.notificationList[index],
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: cubit.notificationList.length)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
