import 'package:flutter/material.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

import 'app_text_field.dart';

class AppInputDecorator extends StatelessWidget {
  const AppInputDecorator({
    Key? key,
    required this.label,
    this.value,
    this.error,
    this.requiredValue = false,
    this.enabled = false,
    this.suffixIcon,
  }) : super(key: key);

  final String? value;
  final String label;
  final String? error;
  final bool requiredValue;
  final bool enabled;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      isEmpty: value?.isEmpty ?? true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.kPrimary,
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.kPrimary,
              width: 2,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.kRed,
              width: 1,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.kRed,
              width: 2,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.kGray,
              width: 1,
            )),
        hintText: "$label",
        contentPadding: const EdgeInsets.only(right: 0, left: 16, top: 12),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.kGrayText.withOpacity(0.6),
        ),
        labelStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        enabled: enabled,
        errorText: error,
        errorStyle:TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.kRed,
        ),

        suffixIcon: suffixIcon ?? const SizedBox(),
      ),

      child: Text(
        value ?? '',
        style: const TextStyle(
          height: 1.4,
          fontWeight: FontWeight.w500,
          color: AppColors.kWhite,
        ),
      ),
    );
  }
}
