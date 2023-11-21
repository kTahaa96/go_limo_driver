import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/empty_view.dart';
import 'package:golimo_driver/common/error_widget.dart.dart';
import 'package:golimo_driver/common/loader/app_loader.dart';
import 'package:golimo_driver/common/state_conditional_builder.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/modules/driver_order/cubit/dirver_orders_cubit.dart';
import 'package:golimo_driver/feature/modules/driver_order/widgets/driver_order_item.dart';
import 'package:golimo_driver/feature/modules/home/cubit/home_cubit.dart';
import 'package:golimo_driver/feature/modules/notificatiton_center/widgets/notification_item.dart';
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
          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              BlocBuilder<DriverOrdersCubit, DriverOrdersState>(
                builder: (context, state) {
                  final cubit = DriverOrdersCubit.of(context);
                  return Container(
                    height: 320.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                        color: AppColors.kPrimaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18.r),
                          bottomRight: Radius.circular(18.r),
                        )),
                    child: StateConditionalBuilder(
                      loadingCondition: state is LoadingUpcomingTripsState,
                      errorCondition: state is ErrorUpcomingTripsState,
                      errorBuilder: (context) => ErrorStateWidget(
                        onRefresh: () {
                          cubit.getUpcomingTripsOrder();
                        },
                      ),
                      loadingBuilder: (context) => const AppLoader(),
                      fallback: (context) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'اوامر شغل اليوم',
                            size: 14.sp,
                            weight: FontWeight.w500,
                            color: AppColors.kWhite,
                          ),
                          8.sbH,
                          cubit.upcomingTrips.isEmpty
                              ? EmptyView(
                                  text: 'لا توجد اوامر شغل حتي الان',
                                  color: AppColors.kWhite,
                                  onRefresh: () {
                                    cubit.getUpcomingTripsOrder();
                                  },
                                )
                              : ListView.builder(
                                  itemCount: cubit.upcomingTrips.length > 2
                                      ? 2
                                      : cubit.upcomingTrips.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return DailyTaskHomePageItem(model: cubit.upcomingTrips[index]);
                                  }),
                        ],
                      ),
                    ),
                  );
                },
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
          );
        },
      ),
    );
  }
}
