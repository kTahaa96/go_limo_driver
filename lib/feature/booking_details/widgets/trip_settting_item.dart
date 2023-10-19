import 'package:flutter/material.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class TripSettingItem extends StatelessWidget {
  final VoidCallback onClick;

  final String label;

  final bool value;

  const TripSettingItem({
    super.key,
    required this.onClick,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            Icon(
              value == true ? Icons.check_box : Icons.check_box_outline_blank,
              color: AppColors.kPrimary,
            ),
            8.sbW,
            AppText(
              '$label',
              size: 13,

              weight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }
}
