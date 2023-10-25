import 'package:flutter/material.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: IconButton(
        icon: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.kBlack,
          size: 16,
        ),
        onPressed: () => NamedNavigatorImpl.pop(),
      ),
    );
  }
}
