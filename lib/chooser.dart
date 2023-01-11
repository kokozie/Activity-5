import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'permission_checker.dart';


Future<File?> chooser() async {
  var isPermissionGranted = await permissionChecker();

  if(!isPermissionGranted) return null;

  var selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

  return selectedImage != null ? File(selectedImage.path) : null;
}
