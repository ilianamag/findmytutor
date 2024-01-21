import 'dart:convert';
import 'package:login/models/profession_model/profession.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberProfessionPreferences {
  //Remember Profession Info
  static Future<void> storeProfessionInfo(Profession professionInfo) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String professionJsonData = jsonEncode(professionInfo.toJson());
    await preferences.setString("currentProfession", professionJsonData);
  }

  //Read Profession Info
  static Future<Profession?> readProfessionInfo () async {
    Profession? currentProfessionInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? professionInfo = preferences.getString("currentProfession");
    if (professionInfo != null) {
      Map<String, dynamic> professionDataMap = jsonDecode(professionInfo);
      currentProfessionInfo = Profession.fromJson(professionDataMap);
    }
    return currentProfessionInfo; 
  }
}