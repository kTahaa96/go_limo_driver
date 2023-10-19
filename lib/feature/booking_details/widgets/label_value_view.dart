import 'package:flutter/material.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class LabelValueView extends StatelessWidget {
  final String label, value;
  final bool? isAirport;

  const LabelValueView({
    super.key,
    required this.label,
    required this.value,
    this.isAirport,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            label,
            size: 13,
            weight: FontWeight.w400,
            color: isAirport == true ? AppColors.kGrayText : AppColors.kBlack,
          ),
          4.sbH,
          AppText(
            value,
            size: 14,
            weight: FontWeight.w600,
            color: isAirport == true ? AppColors.kGrayText : AppColors.kBlack,
          ),
        ],
      ),
    );
  }
}
