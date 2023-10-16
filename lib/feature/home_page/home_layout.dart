import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/home_page/cubit/home_lay_out_cubit.dart';
import 'package:golimo_driver/feature/modules/driver_order/driver_orders.dart';
import 'package:golimo_driver/feature/modules/fuel/fuel_screen.dart';
import 'package:golimo_driver/feature/modules/home/home_page_screen.dart';
import 'package:golimo_driver/feature/modules/rewards/rewards.dart';
import 'package:golimo_driver/helpers/di/di.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screensList = [
    HomePageScreen(),
    DriverOrders(),
    RewardsScreen(),
    FuelScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<HomeLayOutCubit>(),
      child: BlocBuilder<HomeLayOutCubit, HomeLayOutState>(
        builder: (context, state) {
          final cubit = HomeLayOutCubit.of(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (int index) => cubit.updatePageIndex(newVal: index),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              items: <BottomNavigationBarItem>[
                buildItem(
                  path: 'assets/svg_icons/home_inactive.svg',
                  activePath: 'assets/svg_icons/home_active.svg',
                  label: 'الرئيسية',
                ),
                buildItem(
                  path: 'assets/svg_icons/operations_inactive.svg',
                  activePath: 'assets/svg_icons/operations_active.svg',
                  label: 'اوامر التشغيل',
                ),
                buildItem(
                  path: 'assets/svg_icons/rewards_inactive.svg',
                  activePath: 'assets/svg_icons/rewards_active.svg',
                  label: 'الحوافز',
                ),
                buildItem(
                  path: 'assets/svg_icons/fuel_inactive.svg',
                  activePath: 'assets/svg_icons/fuel_active.svg',
                  label: 'الوقود',
                ),
              ],
            ),
            body: screensList[cubit.currentIndex],
          );
        },
      ),
    );
  }

  BottomNavigationBarItem buildItem(
      {required String label, required String path, required String activePath}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        path,
        width: 24,
        height: 24,
      ),
      activeIcon: SvgPicture.asset(
        activePath,
        width: 24,
        height: 24,
        color: AppColors.kPrimary,
      ),
      label: label,
    );
  }
}
