import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String?> captureImageFromCamera() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    return await _saveImage(pickedFile.path);
  }

  return null;
}

Future<String?> pickImageFromGallery() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    return await _saveImage(pickedFile.path);
  }

  return null;
}

Future<String> _saveImage(String imagePath) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileName = DateTime.now().millisecondsSinceEpoch.toString();
  final filePath = "${appDir.path}/$fileName.jpg";

  await File(imagePath).copy(filePath);

  return filePath;
}