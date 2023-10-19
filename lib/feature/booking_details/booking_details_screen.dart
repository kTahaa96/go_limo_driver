import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/back_icon.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/booking_details/cubit/booking_details_cubit.dart';
import 'package:golimo_driver/feature/booking_details/widgets/map_view.dart';
import 'package:golimo_driver/feature/booking_details/widgets/passenger_view.dart';
import 'package:golimo_driver/feature/booking_details/widgets/trip_details_view.dart';
import 'package:golimo_driver/helpers/di/di.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class TripOrder extends StatefulWidget {
  const TripOrder({super.key});

  @override
  State<TripOrder> createState() => _TripOrderState();
}

class _TripOrderState extends State<TripOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: BlocProvider(
        create: (context) => di<BookingDetailsCubit>(),
        child: BlocBuilder<BookingDetailsCubit, BookingDetailsState>(
          builder: (context, state) {
            final cubit = BookingDetailsCubit.of(context);
            return CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.kBackground,
                  expandedHeight: 500.h,
                  flexibleSpace: Material(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.r),
                        bottomRight: Radius.circular(40.r),
                      ),
                    ),
                    child: Stack(
                      children: [
                        const MapWidget(),
                        Container(
                          height: 34.h,
                          margin: EdgeInsets.only(top: 42.h, right: 16.w, left: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(color: AppColors.kBackground),
                                    width: 44.w,
                                    height: 34,
                                    child: Image.asset(
                                      'assets/png_images/travel.png',
                                      width: 38.w,
                                      height: 24.h,
                                    ),
                                  ),
                                  8.sbW,
                                  Column(
                                    children: [
                                      AppText(
                                        'سفر',
                                        size: 14.sp,
                                        weight: FontWeight.w500,
                                      ),
                                      AppText(
                                        '#89843',
                                        size: 12.sp,
                                        weight: FontWeight.w400,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              BackIcon(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: DefaultTabController(
                      length: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.sbH,
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 3.h,
                                color: AppColors.kLightGray,
                                margin: EdgeInsets.only(top: 22.h),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120),
                                child: TabBar(
                                  indicatorWeight: 3.h,
                                  automaticIndicatorColorAdjustment: true,
                                  indicatorColor: AppColors.kPrimary,
                                  labelColor: AppColors.kIndicatorColor,
                                  labelPadding: EdgeInsets.only(bottom: 8.h),
                                  unselectedLabelColor: const Color(0xffBEC2CE),
                                  unselectedLabelStyle: TextStyle(
                                    color: const Color(0xffBEC2CE),
                                    fontFamily: 'Alexandria',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  labelStyle: TextStyle(
                                    color: AppColors.kIndicatorColor,
                                    fontFamily: 'Alexandria',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  tabs: const [
                                    Text("بيانات أمر الشغل"),
                                    Text("بيانات العميل"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 250,
                            child: TabBarView(
                              children: [
                                TripDetailsView(
                                  onBtnTap: () {
                                    cubit.changeOrderState(cubit.orderStatus +1);
                                    log('${cubit.orderStatus}');

                                  },
                                  isAirportTrip: true,
                                  orderStatus: cubit.orderStatus,
                                ),
                                PassengerView(
                                  onBtnTap: () {
                                    cubit.changeOrderState(cubit.orderStatus +1);

                                  },
                                  orderStatus: cubit.orderStatus,
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
