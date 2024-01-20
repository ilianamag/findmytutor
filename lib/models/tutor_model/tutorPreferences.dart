import 'dart:convert';
import 'package:login/models/tutor_model/tutor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberTutorPreferences {
  // Remember Tutor Info
  static Future<void> storeTutorInfo(Tutor tutorInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tutorJsonData = jsonEncode(tutorInfo.toJson());
    await preferences.setString("currentTutor", tutorJsonData);
  }

  // Read Tutor Info
  static Future<Tutor?> readTutorInfo() async {
    Tutor? currentTutorInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? tutorInfo = preferences.getString("currentTutor");
    if (tutorInfo != null) {
      Map<String, dynamic> tutorDataMap = jsonDecode(tutorInfo);
      currentTutorInfo = Tutor.fromJson(tutorDataMap);
    }
    return currentTutorInfo;
  }
}