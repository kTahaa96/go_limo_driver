import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/trip_order/widgets/map_view.dart';
import 'package:golimo_driver/feature/trip_order/widgets/passenger_view.dart';
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
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            // stretch: true,
            // floating: true,
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
                    width: 100.w,
                    height: 34.h,
                    margin: EdgeInsets.only(top: 32, right: 16),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/png_images/travel.png',
                            width: 38.w,
                            height: 24.h,
                          ),
                          // margin: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(color: AppColors.kBackground),
                          width: 44.w,
                          height: 34,
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
                          margin: EdgeInsets.only(top: 23.h),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: TabBar(
                            indicatorWeight: 2.h,
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
                      height: MediaQuery.of(context).size.height - 150,
                      child: const TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          PassengerView(),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
