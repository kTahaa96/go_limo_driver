import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/modules/rewards/widgets/rewards_single_item.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        AppText(
                          'الرصيد الحالي',
                          size: 12.sp,
                          weight: FontWeight.w400,
                          color: AppColors.kWhite,
                        ),
                        6.sbH,
                        AppText(
                          'EGP 1,200',
                          size: 20.sp,
                          weight: FontWeight.w500,
                          color: AppColors.kWhite,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AppText(
                          'إجمالي الحوافز',
                          size: 12.sp,
                          weight: FontWeight.w400,
                          color: AppColors.kWhite,
                        ),
                        6.sbH,
                        AppText(
                          'EGP 7,200',
                          size: 20.sp,
                          weight: FontWeight.w500,
                          color: AppColors.kWhite,
                        ),
                      ],
                    ),
                  ],
                ),
                8.sbH,
              ],
            ),
          ),
          16.sbH,
          DefaultTabController(
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
                      Text("حوافز مالية"),
                      Text("جوائز فورية"),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 150,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 19.w),
                          separatorBuilder: (context, index) => const Divider(
                                thickness: 2,
                              ),
                          itemCount: 12,
                          shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const RewardsSingleItem();
                          }),
                      ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 19.w),
                          separatorBuilder: (context, index) => const Divider(
                                thickness: 2,
                              ),
                          itemCount: 12,
                          shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const RewardsSingleItem();
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
