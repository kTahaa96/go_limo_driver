import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/app_logo.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/splash/cubit/splash_cubit.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSplashBgColor,
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticatedState) {
            NamedNavigatorImpl.push(Routes.login, clean: true);
          }
          if (state is AuthenticatedState) {
            NamedNavigatorImpl.push(Routes.homePage, clean: true);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    margin: EdgeInsets.only(top: 48.h),
                    // decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                      child: Pulse(
                        infinite: true,
                        child: AppLogo(
                          height: 50.h,
                          width: 150.w,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "by ",
                        style: TextStyle(color: AppColors.kWhite, fontSize: 28.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32.h),
                        child: Image.asset(
                          "assets/png_images/Gobus-On-Dark-BG.png",
                          width: 90.w,
                          height: 30.h,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              // Center(
              //   child: AnimatedContainer(
              //     duration: const Duration(milliseconds: 500),
              //     height: !cubit.openAnimation ? 0 : 1087,
              //     width: !cubit.openAnimation ? 0 : 1087,
              //     decoration: BoxDecoration(
              //       color: AppColors.kPrimary,
              //       shape: !cubit.openAnimation ? BoxShape.circle : BoxShape.rectangle,
              //       // borderRadius: BorderRadius.circular(!openAnimation ?600 : 0),
              //     ),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
