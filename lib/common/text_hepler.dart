import 'package:flutter/material.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;

  final Color? color;

  final double? size;
  final int? maxLines;

  final FontWeight? weight;
  final bool? centerText, underLintText, withOverFlow;

  const AppText(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.centerText,
    this.underLintText,
    this.withOverFlow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: centerText == true ? TextAlign.center : TextAlign.start,
      maxLines: maxLines ?? 2,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: color ?? AppColors.kBlack,
          fontSize: size ?? 14,
          fontWeight: weight ?? FontWeight.w400,
          decoration: underLintText == true ? TextDecoration.underline : null),
    );
  }
}
