// import 'dart:io';
//
// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:golimo/helpers/di/di.dart';
// import 'package:golimo/helpers/local/cache_helper.dart';
// import 'package:golimo/helpers/local_data_base/enum_initialization.dart';
// import 'package:open_settings/open_settings.dart';
//
// class NotificationPermissionHelper extends WidgetsBindingObserver {
//   final AsyncCallback? resumeCallBack;
//
//   NotificationPermissionHelper({
//     this.resumeCallBack,
//   });
//
//   @override
//   Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
//     switch (state) {
//       case AppLifecycleState.resumed:
//         if (resumeCallBack != null) {
//           await resumeCallBack!.call();
//         }
//         break;
//       case AppLifecycleState.inactive:
//       case AppLifecycleState.paused:
//       case AppLifecycleState.detached:
//         break;
//     }
//   }
//
//   Future<bool> showPermissionScreen() async {
//     bool? permission =
//     di<CacheHelper>().get(CachingKey.userNotificationPermission);
//     if (permission == null) {
//       di<CacheHelper>().put(CachingKey.userNotificationPermission, true);
//       permission = true;
//     }
//     final settings = await FirebaseMessaging.instance.getNotificationSettings();
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       di<CacheHelper>().put(CachingKey.userNotificationPermission, true);
//       permission = true;
//     } else if (permission) {
//       if (settings.authorizationStatus == AuthorizationStatus.notDetermined ||
//           settings.authorizationStatus == AuthorizationStatus.denied ||
//           settings.authorizationStatus == AuthorizationStatus.provisional) {
//         return true;
//       }
//     }
//     return false;
//   }
//
//   Future<void> onRequestPermission() async {
//     if (Platform.isAndroid) {
//       OpenSettings.openAppSetting();
//     } else {
//       await FirebaseMessaging.instance
//           .getNotificationSettings()
//           .then((value) async {
//         if (value.authorizationStatus == AuthorizationStatus.denied ||
//             value.authorizationStatus == AuthorizationStatus.provisional) {
//           OpenSettings.openNotificationSetting();
//         } else if (value.authorizationStatus ==
//             AuthorizationStatus.notDetermined) {
//           await FirebaseMessaging.instance.requestPermission();
//         }
//       });
//     }
//   }
// }
