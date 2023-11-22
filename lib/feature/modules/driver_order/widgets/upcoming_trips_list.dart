import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/common/custom_refresh_view.dart';
import 'package:golimo_driver/common/error_widget.dart.dart';
import 'package:golimo_driver/common/loader/app_loader.dart';
import 'package:golimo_driver/feature/modules/driver_order/cubit/dirver_orders_cubit.dart';
import 'package:golimo_driver/feature/modules/driver_order/widgets/driver_order_item.dart';

import '../../../../common/state_conditional_builder.dart';

class UpcomingOrdersList extends StatelessWidget {
  const UpcomingOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverOrdersCubit, DriverOrdersState>(
      builder: (context, state) {
        final cubit = DriverOrdersCubit.of(context);
        return StateConditionalBuilder(
          loadingCondition: state is LoadingUpcomingTripsState,
          errorCondition: state is ErrorUpcomingTripsState,
          errorBuilder: (context) => ErrorStateWidget(
            onRefresh: () {
              cubit.getUpcomingTripsOrder();
            },
          ),
          loadingBuilder: (context) => const AppLoader(),
          fallback: (context) => CustomRefreshIndicator(
            onRefresh: () async {
              cubit.getUpcomingTripsOrder();
            },
            child: ListView.builder(
              itemCount: cubit.upcomingTrips.length,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  DailyTaskHomePageItem(model: cubit.upcomingTrips[index]),
            ),
          ),
        );
      },
    );
  }
}
