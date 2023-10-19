import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onBtnTap;
  final Widget? icon;
  final Color? color, borderColor, textColor;
  final bool? withMargin, withPadding;
  final double? width;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onBtnTap,
    this.icon,
    this.color,
    this.borderColor,
    this.textColor,
    this.withMargin,
    this.withPadding,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBtnTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: withPadding == false ? 0 : 30),
        height: 60.h,
        width: width,
        decoration: BoxDecoration(
            color: color ?? const Color(0xff252525),
            borderRadius: BorderRadius.circular(50),
            border: borderColor == null
                ? null
                : Border.all(
                    color: borderColor == null && textColor == null ? color! : borderColor!,
                    width: 2,
                  )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Padding(
              padding: const EdgeInsets.only(left: 14),
              child: icon ?? const SizedBox(),
            )
                : const SizedBox(),
            Text(
              buttonText,
              style: TextStyle(
                color: textColor ?? AppColors.kWhite,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
