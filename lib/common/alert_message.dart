import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';

class PopUpHelper extends StatelessWidget {
  final String message;

  const PopUpHelper({Key? key, required this.message}) : super(key: key);

  static showSnakeBar({required String message, String? actionLabel, VoidCallback? onPressed}) {
    return showDialog<void>(
      context: NamedNavigatorImpl.navigatorState.currentContext!,
      barrierDismissible: true,
      builder: (_) {
        return PopUpHelper(
          message: message,
        );
      },
    );
  }
  static showNotificationSnackBar({required String message, String? actionLabel, VoidCallback? onPressed}) {
    return showDialog<void>(
      context: NamedNavigatorImpl.navigatorState.currentContext!,
      barrierDismissible: true,
      builder: (_) {
        return PopUpHelper(
          message: message,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: AlertDialog(

        backgroundColor: AppColors.kWhite,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8),
        alignment: Alignment.topCenter,

        content: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.yellow,
                size: 20.w,
              ),
              SizedBox(width: 12.w),
              Expanded(
                  child: Text(
                message,
                style: TextStyle(color: AppColors.kGrayText),
              )),
            ],
          ),
        ),
        // actions: [
        //   TextButton(
        //     child: const Text(
        //       'Update',
        //     ),
        //     onPressed: () async {
        //       final packageInfo = await PackageInfo.fromPlatform();
        //       if (Platform.isAndroid) {
        //         final String packageName = packageInfo.packageName;
        //         _launchUrl("https://play.google.com/store/apps/details?id=com.golimo.passenger");
        //         log("DONE Android :https://play.google.com/store/apps/details?id=$packageName ");
        //       } else {
        //         _launchUrl("https://apps.apple.com/eg/app/golimo-egypt/id1572190545");
        //         log("DONE ios: https://apps.apple.com/eg/app/golimo-egypt/id1572190545");
        //       }
        //     },
        //   ),
        //   shouldUpdate
        //       ? const SizedBox()
        //       : TextButton(
        //     child: const Text(
        //       'Later',
        //     ),
        //     onPressed: () {
        //       NamedNavigatorImpl.pop();
        //     },
        //   ),
        // ],
      ),
    );
  }
}
