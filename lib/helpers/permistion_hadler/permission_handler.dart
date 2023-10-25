import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {

  Future<void> requestCameraPermission() async {
    const permission = Permission.camera;

    if (await permission.isDenied) {
      await permission.request();
    }
  }}
