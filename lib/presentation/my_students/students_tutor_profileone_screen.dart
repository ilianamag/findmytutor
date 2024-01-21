import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:login/api_connection/api_connection.dart';
import 'package:login/core/app_export.dart';
import 'package:login/models/review_model/review.dart';
import 'package:login/models/tutor_model/tutor.dart';
import 'package:login/models/tutor_model/tutorPreferences.dart';
import 'package:login/widgets/Pair/Pair.dart';
import 'package:login/widgets/appbarfortutors.dart';
import 'package:login/widgets/custom_bottom_bar_teacher.dart';
import 'package:login/widgets/my_students.dart';


class StudentProfileone extends StatefulWidget {
  const StudentProfileone({Key? key}) : super(key: key);

  @override
  State<StudentProfileone> createState() => _StudentProfileone();
}

class _StudentProfileone extends State<StudentProfileone> {
  Tutor? tutorInfo;
  List<Pair<String, String>> students = [];

  void rebuildScreen() {
    setState(() {
      // Just want to rebuild
    });
  }

  _initializeData() async {
    tutorInfo = await RememberTutorPreferences.readTutorInfo();
    students = await _fetchStudents();
  }

  Future<List<Pair<String, String>>> _fetchStudents() async {
    List<Pair<String, String>> studentList;
    final response = await http.post(
      Uri.parse(API.myStud),
      body: {
        "tut_email": tutorInfo?.email,
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      // Convert List<dynamic> to List<Pair<String, String>>
      studentList = data.map((item) {
        return Pair<String, String>(
          item['fullname'] as String,
          item['profilepic'] as String,
        );
      }).toList();
    } else {
      throw Exception('Failed to load students');
    }
    return studentList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppWidgets.buildAppBar2(context),
        drawer: AppWidgets.buildDrawer2(context),
        body: FutureBuilder(
          future: _initializeData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 69.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "My",
                                style: TextStyle(
                                  color: appTheme.black900,
                                  fontSize: 40.fSize,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Students",
                                style: TextStyle(
                                  color: appTheme.black900,
                                  fontSize: 40.fSize,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 51.v),

                      for (int i = 0; i < students.length; i++)
                        Column(
                          children: [
                            StudentCardWidget(
                              rebuildCallback: rebuildScreen,
                              studentProfilePic: students[i].second,
                              studentName: students[i].first,
                            ),
                            if (i < students.length - 1)
                              Divider(
                                color: Color(0xFFDC2E2E),
                                thickness: 1,
                                indent: 90,
                                endIndent: 16,
                              ),
                          ],
                        ),
                      SizedBox(height: 32.0),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        bottomNavigationBar: _buildBottomBar2(context),
      ),
    );
  }

  Widget _buildBottomBar2(BuildContext context) {
    return CustomBottomBar2(onChanged: (BottomBarEnum2 type) {});
  }
}