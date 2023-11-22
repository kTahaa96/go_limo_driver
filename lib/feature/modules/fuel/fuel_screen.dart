import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/custom_refresh_view.dart';
import 'package:golimo_driver/common/error_widget.dart.dart';
import 'package:golimo_driver/common/loader/app_loader.dart';
import 'package:golimo_driver/common/state_conditional_builder.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/add_fuel_screen/add_fuel_screen.dart';
import 'package:golimo_driver/feature/modules/fuel/cubit/fuel_cubit.dart';
import 'package:golimo_driver/feature/modules/fuel/widgets/fuel_item.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class FuelScreen extends StatelessWidget {
  const FuelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 150.w,
        height: 62.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.kBlack,
          borderRadius: BorderRadius.circular(50),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFullScreen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_circle_rounded,
                color: AppColors.kWhite,
              ),
              4.sbW,
              const AppText(
                'اضافة وقود',
                color: AppColors.kWhite,
              )
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: BlocBuilder<FuelCubit, FuelState>(
          builder: (context, state) {
            final cubit = FuelCubit.of(context);
            return StateConditionalBuilder(
              loadingCondition: state is LoadingGetFuelState,
              loadingBuilder: (context) => const AppLoader(),
              errorCondition: state is LoadingGetFuelState,
              errorBuilder: (context) => ErrorStateWidget(
                onRefresh: () {
                  cubit.getFuelHistory();
                },
              ),
              fallback: (context) => CustomRefreshIndicator(
                onRefresh: () async {
                  cubit.getFuelHistory();
                },
                child: ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    shrinkWrap: true,
                    itemCount: cubit.fuelHistoryResponse!.data.length,
                    itemBuilder: (context, index) =>
                        FuelItem(model: cubit.fuelHistoryResponse!.data[index])),
              ),
            );
          },
        ),
      ),
    );
  }
}
