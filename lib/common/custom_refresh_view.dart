import 'package:flutter/material.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final VoidCallback onRefresh;

  final Widget child;

  const CustomRefreshIndicator({super.key, required this.onRefresh, required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.kBlack,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      backgroundColor: AppColors.kWhite,
      displacement: 100.0,
      edgeOffset: 5,
      onRefresh: () async {
        onRefresh.call();
      },
      child: child,
    );
  }
}
