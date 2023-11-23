import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/custom_refresh_view.dart';
import 'package:golimo_driver/common/error_widget.dart.dart';
import 'package:golimo_driver/common/loader/app_loader.dart';
import 'package:golimo_driver/common/state_conditional_builder.dart';
import 'package:golimo_driver/feature/modules/rewards/cubit/rewards_cubit.dart';
import 'package:golimo_driver/feature/modules/rewards/widgets/rewards_single_item.dart';

class AwardsView extends StatelessWidget {
  const AwardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RewardsCubit, RewardsState>(
      builder: (context, state) {
        final cubit = RewardsCubit.of(context);
        return StateConditionalBuilder(
          loadingCondition: state is LoadingGetAwardState,
          errorCondition: state is ErrorGetAwardState,
          errorBuilder: (context) => ErrorStateWidget(
            onRefresh: () {
              cubit.getAwards();
            },
          ),
          loadingBuilder: (context) => const AppLoader(),
          fallback: (context) => CustomRefreshIndicator(
            onRefresh: () {
              cubit.getAwards();
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  separatorBuilder: (context, index) => const Divider(thickness: 2),
                  itemCount: cubit.awardsResponse!.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RewardsSingleItem(
                      date: cubit.awardsResponse!.data[index].createdAt,
                      label: cubit.awardsResponse!.data[index].award.name,
                      amount: 90,
                      isPlus: true,
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
