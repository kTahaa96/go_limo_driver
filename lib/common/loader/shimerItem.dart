import 'package:flutter/material.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  final double width, height, radius;

  const ShimmerItem({Key? key, required this.width, required this.height, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Container(
          decoration: BoxDecoration(color: AppColors.kWhite, borderRadius: BorderRadius.circular(radius)),
          width: width,
          height: height,
        ));
  }
}
