import 'package:permission_handler/permission_handler.dart';

Future<bool> permissionChecker() async {
  var permissionStatus = await Permission.storage.status;

  if (permissionStatus == PermissionStatus.granted) {
    return true;
  } else {
    var askPermission = await Permission.storage.request();

    if (askPermission == PermissionStatus.granted) {
      return true;
    } else {
      if(askPermission == PermissionStatus.permanentlyDenied){
        openAppSettings();
        return false;
      }
      return false;
    }
  }
}
