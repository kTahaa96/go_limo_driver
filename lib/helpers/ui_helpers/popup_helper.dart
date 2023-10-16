import 'package:flutter/material.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class PopupHelper {
  static Future<bool?> showDialog({
    required BuildContext context,
    required Widget content,
    bool? barrierDismissible,
    List<Widget>? options,
  }) async {
    return await showGeneralDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: AlertDialog(
            alignment: Alignment.center,
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            content: content,

          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
