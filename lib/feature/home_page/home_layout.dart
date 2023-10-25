import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/bottom_navigation_bar.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/home_page/cubit/home_lay_out_cubit.dart';
import 'package:golimo_driver/helpers/di/di.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<HomeLayOutCubit>(),
      child: BlocBuilder<HomeLayOutCubit, HomeLayOutState>(
        builder: (context, state) {
          final cubit = HomeLayOutCubit.of(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: cubit.currentIndex == 0 || cubit.currentIndex == 2
                  ? AppColors.kPrimaryBackground
                  : AppColors.kBackground,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          cubit.updatePageIndex(newVal: 5);
                        },
                        child: SvgPicture.asset(
                          'assets/svg_icons/doughnut_chart.svg',
                          width: 24.w,
                          height: 24.h,
                          color: cubit.currentIndex == 0 || cubit.currentIndex == 2
                              ? AppColors.kWhite
                              : AppColors.kBlack,
                        ),
                      ),
                      8.sbW,
                      InkWell(
                        onTap: () {
                          cubit.updatePageIndex(newVal: 4);
                        },
                        child: SvgPicture.asset(
                          'assets/svg_icons/home_notificatoin.svg',
                          width: 24.w,
                          height: 24.h,
                          color: cubit.currentIndex == 0 || cubit.currentIndex == 2
                              ? AppColors.kWhite
                              : AppColors.kBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              centerTitle: cubit.currentIndex != 0 ? true : false,
              leading: Container(
                width: 30.w,
                height: 30.h,
                padding: EdgeInsets.only(right: 16.w, left: 8),
                child: SvgPicture.asset(
                  'assets/svg_icons/driver_icon.svg',
                ),
              ),
              title: Text(
                setAppBarTitle(cubit.currentIndex),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  fontFamily: 'Alexandria',
                  color: cubit.currentIndex == 0 || cubit.currentIndex == 2
                      ? AppColors.kWhite
                      : AppColors.kBlack,
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onItemTap: (index) => cubit.updatePageIndex(newVal: index),
            ),
            body: cubit.currentWidget,
          );
        },
      ),
    );
  }

  String setAppBarTitle(int index) {
    if (index == 1) {
      return 'أوامر الشغل';
    } else if (index == 2) {
      return 'الحوافز';
    } else if (index == 3) {
      return 'الوقود';
    } else if (index == 4) {
      return 'التنبيهات';
    } else if (index == 5) {
      return 'مركز المساعدة';
    }
    return 'اهلا محمد';
  }
}
