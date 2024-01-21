import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:login/api_connection/api_connection.dart';
import 'package:login/models/student_model/student.dart';
import 'package:login/models/student_model/studentPreferences.dart';
import 'package:login/presentation/edit_prof_2.dart';
import 'package:path_provider/path_provider.dart';


Future<String> _saveImage(String email, String imagePath) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileName = DateTime.now().millisecondsSinceEpoch.toString();
  final filePath = "${appDir.path}/$fileName.jpg";

  await File(imagePath).copy(filePath);

  // Update database with user email and image path
  await updateProfilePicture(email, filePath);

  return filePath;
}


Future<void> updateProfilePicture(String email, String imagePath) async {
  final response = await http.post(
    Uri.parse(API.updateProfile),
    body: {
      'email': email,
      'imagePath': imagePath,
    },
  );

  if (response.statusCode == 200) {
    // Successful update, handle the response if needed
    print('Profile picture updated successfully');
  } else {
    // Handle errors, e.g., display an error message to the user
    print('Failed to update profile picture');
  }
}

// Usage example'
Student? studentInfo;

Future<void> UpdateUserProfilePicture(String userEmail) async {
  String? imagePath = await captureImageFromCamera();

  if (imagePath != null) {
    await _saveImage(userEmail, imagePath);
  }
}
