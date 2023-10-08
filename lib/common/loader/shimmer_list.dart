import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/loader/shimerItem.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:intl/intl.dart';

class ShimmerList extends StatelessWidget {
  final ShimmerRouterModel model;

  const ShimmerList({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlack,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  model.address,
                  style: TextStyle(color: AppColors.kPrimary, fontWeight: FontWeight.w400, fontSize: 13.sp),
                ),
                SizedBox(
                  height: 4.sp,
                ),
                Row(
                  children: [
                    Text(
                      "${DateFormat('EE, d MMM,').format(model.date)}",
                      style: TextStyle(color: AppColors.kWhite, fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 6.sp),
                    SvgPicture.asset(
                      "assets/svg_icons/calender.svg",
                      color: AppColors.kWhite,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(16.w),
              // height: 210.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16),
              decoration: BoxDecoration(color: AppColors.kWhite, borderRadius: BorderRadius.circular(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ShimmerItem(width: 118.w, height: 72.h, radius: 2),
                      SizedBox(width: 20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerItem(width: 85.w, height: 18.h, radius: 2),
                          SizedBox(height: 4.h),
                          ShimmerItem(width: 135.w, height: 18.h, radius: 2),
                        ],
                      )
                    ],
                  ),
                  Divider(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              ShimmerItem(width: 20.w, height: 20.h, radius: 100),
                              SizedBox(width: 5.w),
                              ShimmerItem(width: 100.w, height: 18.h, radius: 2),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              ShimmerItem(width: 20.w, height: 20.h, radius: 100),
                              SizedBox(width: 5.w),
                              ShimmerItem(width: 128.w, height: 18.h, radius: 2),
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Row(
                            children: [
                              ShimmerItem(width: 20.w, height: 20.h, radius: 100),
                              SizedBox(width: 5.w),
                              ShimmerItem(width: 158.w, height: 18.h, radius: 2),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 16.h),
                          ShimmerItem(width: 55.w, height: 12.h, radius: 2),
                          SizedBox(height: 6.h),
                          ShimmerItem(width: 84.w, height: 18.h, radius: 2),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class ShimmerRouterModel {
  final String address;

  final DateTime date;

  ShimmerRouterModel({required this.address, required this.date});
}
