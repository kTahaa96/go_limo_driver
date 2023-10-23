import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopupHelper {
  static gShowDialog({
    required BuildContext context,
    required Widget content,
    bool? barrierDismissible,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible ?? false,
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
          child: Container(
            width: double.infinity,
            height: 323.h,
            padding: EdgeInsets.all(20.w),
            child: content,
          ),
        ),
      ),
    );
  }
}
