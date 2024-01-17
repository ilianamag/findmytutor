import 'dart:convert';
import 'package:login/models/student_model/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberStudentPreferences {
  //Remember Student Info
  static Future<void> storeStudentInfo(Student studentInfo) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String studentJsonData = jsonEncode(studentInfo.toJson());
    await preferences.setString("currentStudent", studentJsonData);
  }

  //Read Student Info
  static Future<Student?> readStudentInfo () async {
    Student? currentStudentInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? studentInfo = preferences.getString("currentStudent");
    if (studentInfo != null) {
      Map<String, dynamic> studentDataMap = jsonDecode(studentInfo);
      currentStudentInfo = Student.fromJson(studentDataMap);
    }
    return currentStudentInfo; 
  }
}