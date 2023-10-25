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
    return icon != null
        ? OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              primary: textColor ?? AppColors.kWhite,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16),
              backgroundColor: color ?? AppColors.kBlack,
              minimumSize: Size(width ?? 380.w, 52.h),
              alignment: Alignment.center,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              textStyle: TextStyle(
                  color: textColor ?? AppColors.kWhite,
                  fontSize: 14.sp,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w600),
              side: BorderSide(
                color: borderColor ?? AppColors.kBlack,
              ),
            ),
            icon: icon!,
            label: Text(buttonText),
          )
        : color == AppColors.kWhite
            ? TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: textColor,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  backgroundColor: color ?? AppColors.kBlack,
                  alignment: Alignment.center,
                  minimumSize: Size(width ?? 380.w, 52.h),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  textStyle: TextStyle(
                      fontSize: 14.sp, fontFamily: 'Alexandria', fontWeight: FontWeight.w600),
                  side: BorderSide(
                    color: borderColor ?? AppColors.kBlack,
                  ),
                ),
                onPressed: onBtnTap,
                child: Text(buttonText),
              )
            : ElevatedButton(
                onPressed: onBtnTap,
                style: OutlinedButton.styleFrom(
                  primary: textColor ?? AppColors.kWhite,
                  minimumSize: Size(width ?? 380.w, 52.h),
                  // NEW
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  backgroundColor: color ?? AppColors.kBlack,
                  alignment: Alignment.center,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  textStyle: TextStyle(
                      color: textColor ?? AppColors.kWhite,
                      fontSize: 14.sp,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w600),
                  side: BorderSide(
                    color: borderColor ?? AppColors.kBlack,
                  ),
                ),
                child: Text(buttonText),
              );
    // return InkWell(
    //   onTap: onBtnTap,
    //   child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: withPadding == false ? 0 : 30),
    //     height: 60.h,
    //     width: width,
    //     decoration: BoxDecoration(
    //         color: color ?? const Color(0xff252525),
    //         borderRadius: BorderRadius.circular(50),
    //         border: borderColor == null
    //             ? null
    //             : Border.all(
    //                 color: borderColor == null && textColor == null ? color! : borderColor!,
    //                 width: 2,
    //               )),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         icon != null
    //             ? Padding(
    //           padding: const EdgeInsets.only(left: 14),
    //           child: icon ?? const SizedBox(),
    //         )
    //             : const SizedBox(),
    //         Text(
    //           buttonText,
    //           style: TextStyle(
    //             color: textColor ?? AppColors.kWhite,
    //             fontSize: 16,
    //             fontWeight: FontWeight.w700,
    //           ),
    //         ),
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}
