import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';
import 'package:golimo_driver/helpers/ui_helpers/popup_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class ImagePickerHelper {
  static showOption({required BuildContext context, required ValueChanged<File?> onGet}) {
    showDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: const Center(child: Text('Select Image Source')),
          actions: [
            CupertinoDialogAction(
                child: const Text('Gallery'), onPressed: () => openGallery(onGet: onGet)),
            CupertinoDialogAction(
                child: const Text('Camera'), onPressed: () => openCamera(onGet: onGet)),
          ],
        );
      },
    );
  }

  static openGallery({required ValueChanged<File?> onGet}) async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      onGet(File(image!.path));
    } catch (e) {
      var status = await Permission.photos.status;
      if (status.isDenied) {
        PopupHelper.gShowDialog(
          context: NamedNavigatorImpl.navigatorState.currentContext!,
          title: 'رسالة من النظام',
          content: Column(
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                color: AppColors.kPrimary,
                size: 50,
              ),
              24.sbH,
              const AppText('الرجاء السماح للطبيق بالوصول الي الكاميرا'),
              24.sbH,
            ],
          ),
          confirmText: 'الذهاب الي الاعدادات',
          canselText: 'اغلاق',
          onConfirm: () => openAppSettings(),
          onCansel: () => NamedNavigatorImpl.pop(),
        );
      }
    }
  }

  static openCamera({required ValueChanged<File?> onGet}) async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      onGet(File(image!.path));
    } catch (e) {
      log(e.toString());
      var status = await Permission.photos.status;
      if (status.isDenied) {
        PopupHelper.gShowDialog(
          context: NamedNavigatorImpl.navigatorState.currentContext!,
          title: 'رسالة من النظام',
          content: Column(
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                color: AppColors.kPrimary,
                size: 50,
              ),
              24.sbH,
              const AppText('الرجاء السماح للطبيق بالوصول الي الكاميرا'),
              24.sbH,
            ],
          ),
          confirmText: 'الذهاب الي الاعدادات',
          canselText: 'اغلاق',
          onConfirm: () => openAppSettings(),
          onCansel: () => NamedNavigatorImpl.pop(),
        );
      }
    }
  }
}
