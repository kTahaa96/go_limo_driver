import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/conditional_builder.dart';
import 'package:golimo_driver/common/empty_view.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/core/models/driver_order_response/driver_trips_item_model.dart';
import 'package:golimo_driver/feature/modules/driver_order/widgets/driver_order_item.dart';

class OrdersList extends StatelessWidget {
  final List<TripItemModel> list;
  final VoidCallback? onRefresh;

  const OrdersList({super.key, required this.list, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.isEmpty,
      builder: (context) => EmptyView(
        text: 'لا توجد اوامر شغل حتي الان',
        color: AppColors.kDarkGreyText,
        onRefresh: () {
          onRefresh?.call();
        },
      ),
      fallback: (context) => ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => DailyTaskHomePageItem(model: list[index]),
      ),
    );
  }
}
