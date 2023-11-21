import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/modules/driver_order/widgets/orders_list.dart';
import 'package:golimo_driver/feature/modules/driver_order/widgets/upcoming_trips_list.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class DriverOrders extends StatelessWidget {
  const DriverOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.kIndicatorColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 50.w),
                  padding: const EdgeInsets.all(2),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelColor: AppColors.kIndicatorColor,
                    unselectedLabelColor: AppColors.kWhite,
                    unselectedLabelStyle: const TextStyle(
                      color: AppColors.kWhite,
                      fontFamily: 'Alexandria',
                    ),
                    labelStyle: const TextStyle(
                      color: AppColors.kIndicatorColor,
                      fontFamily: 'Alexandria',
                    ),

                    labelPadding: const EdgeInsets.symmetric(vertical: 4),
                    // labelColor: Color(0xff2a2a2a),
                    tabs: const [
                      Text("أوامر قادمة"),
                      Text("أوامر سابقة"),
                    ],
                  ),
                ),
                16.sbH,
                SizedBox(
                  height: MediaQuery.of(context).size.height - 280,
                  child: const TabBarView(
                    children: [
                      UpcomingOrdersList(),
                      PreviousOrdersList(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
