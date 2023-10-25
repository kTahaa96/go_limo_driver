import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class PopupHelper {
  static gShowDialog({
    required BuildContext context,
    required Widget content,
    String? title,
    String? confirmText,
    String? canselText,
    VoidCallback? onConfirm,
    VoidCallback? onCansel,
    bool? barrierDismissible,
  }) {
    showDialog(
      // barrierDismissible: barrierDismissible ?? false,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Dialog(
          insetPadding: EdgeInsets.all(20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 20.h),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Color(0xff999999),
                      size: 16,
                    )),
              ),
              Container(
                width: double.infinity,
                height: 323.h,
                padding: EdgeInsets.all(20.w),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    30.sbH,
                    content,
                    16.sbH,
                    confirmText != null
                        ? CustomButton(
                            buttonText: '$confirmText',
                            onBtnTap: onConfirm ??
                                () {
                                  print("Button Click");
                                },
                          )
                        : SizedBox(),
                    SizedBox(
                      height: canselText != null ? 8 : 0,
                    ),
                    canselText != null
                        ? CustomButton(
                            buttonText: '$canselText',
                            onBtnTap: () => Navigator.pop(context),
                            color: AppColors.kWhite,
                            textColor: AppColors.kPrimary,
                            borderColor: AppColors.kWhite,
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
