import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/back_icon.dart';
import 'package:golimo_driver/common/state_conditional_builder.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/add_fuel_screen/widgets/after_add_fuel.dart';
import 'package:golimo_driver/feature/add_fuel_screen/widgets/befor_add.dart';
import 'package:golimo_driver/feature/add_fuel_screen/widgets/fuel_recipt_view.dart';
import 'package:golimo_driver/feature/add_fuel_screen/widgets/stepper_item.dart';
import 'package:golimo_driver/feature/modules/fuel/cubit/fuel_cubit.dart';
import 'package:golimo_driver/helpers/di/di.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class AddFullScreen extends StatefulWidget {
  const AddFullScreen({super.key});

  @override
  State<AddFullScreen> createState() => _AddFullScreenState();
}

class _AddFullScreenState extends State<AddFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
        elevation: 0,
        leading: Container(
          width: 30.w,
          height: 30.h,
          padding: EdgeInsets.only(right: 16.w, left: 8),
          child: SvgPicture.asset(
            'assets/svg_icons/driver_icon.svg',
          ),
        ),
        title: const AppText(
          'الوقود',
        ),
        actions: const [
          BackIcon(),
        ],
      ),
      body: BlocProvider(
        create: (context) => di<FuelCubit>(),
        child: BlocConsumer<FuelCubit, FuelState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = FuelCubit.of(context);
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  24.sbH,
                  _buildStepper(cubit.currentView),
                  48.sbH,
                  StateConditionalBuilder(
                    loadingCondition: cubit.currentView == 0,
                    loadingBuilder: (context) => const BeforeAddFuelView(),
                    errorCondition: cubit.currentView == 1,
                    errorBuilder: (context) => const AfterAddFuel(),
                    fallback: (context) => const FinalFuelView(),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStepper(int currentView) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StepperItem(
          index: 0,
          isActive: currentView == 0 ? true : false,
          isDone: currentView > 0 ? true : false,
        ),
        Container(
          height: 1.h,
          width: 52.w,
          color: AppColors.kLightGray,
        ),
        StepperItem(
          index: 1,
          isActive: currentView == 1 ? true : false,
          isDone: currentView > 1 ? true : false,
        ),
        Container(
          height: 1.h,
          width: 52.w,
          color: AppColors.kLightGray,
        ),
        StepperItem(
          index: 2,
          isActive: currentView == 2 ? true : false,
          isDone: currentView > 2 ? true : false,
        ),
      ],
    );
  }
}
