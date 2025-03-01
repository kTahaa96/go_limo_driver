import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class BottomSheetHelper {
  static Future<bool?> gShowModalBottomSheet({
    required BuildContext context,
    required Widget content,
    Color? backgroundColor,
    bool isPaddingAll = true,
    bool isHidden = false,
    double? maxHeight,
    double? maxWidth,
    bool barrierDismissible = true,
    Color? handleColor,
    bool disableMinimumHeight = false,
  }) async {
    return await showModalBottomSheet(
      // backgroundColor: AppColors.kBlueBackBackground,
      isDismissible: barrierDismissible,
      isScrollControlled: true,
      context: context,
      // constraints: BoxConstraints(
      //     maxHeight: maxHeight ?? 330,
      //     minHeight: disableMinimumHeight ? 0.0 : MediaQuery.of(context).size.height * 0.4,
      //     maxWidth: maxWidth ?? MediaQuery.of(context).size.width),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.r),
        topLeft: Radius.circular(20.r),
      )),
      builder: (BuildContext context) {
        return !isHidden
            ? Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  // constraints: BoxConstraints(
                  //     maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.9,
                  //     minHeight:
                  //         disableMinimumHeight ? 0.0 : MediaQuery.of(context).size.height * 0.4),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 15.0),
                  height: maxHeight ?? 350.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 5.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: AppColors.kGray,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      15.sbH,
                      Flexible(child: content),
                    ],
                  ),
                ),
              )
            : Container(
                padding: EdgeInsets.only(bottom: 24.h),
                child: content,
              );
      },
    );
  }
}
