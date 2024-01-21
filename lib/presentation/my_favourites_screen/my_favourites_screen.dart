import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:login/api_connection/api_connection.dart';
import 'package:login/core/app_export.dart';
import 'package:login/models/review_model/review.dart';
import 'package:login/models/student_model/student.dart';
import 'package:login/models/student_model/studentPreferences.dart';
import 'package:login/models/tutor_model/tutor.dart';
import 'package:login/widgets/Triplet/Triplet.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/my_tutors.dart';
class MyFavouritesScreen extends StatefulWidget {
  const MyFavouritesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<MyFavouritesScreen> createState() => _MyFavouritesScreenState();
}

class _MyFavouritesScreenState extends State<MyFavouritesScreen> {
  Student? studentInfo;
  List<Triplet<String, String, String>> favorites = [];

  void rebuildScreen() {
    setState(() {
      //Just want to rebuild
    });
  }

  _initializeData() async{
    studentInfo = await RememberStudentPreferences.readStudentInfo();
    favorites = await _fetchFavTuts();
  }

  Future<List<Triplet<String, String, String>>> _fetchFavTuts() async {
    List<Triplet<String, String, String>> tripletListT;
    final response2 = await http.post(
      Uri.parse(API.fTutfav),
      body: {
        "stud_email": studentInfo?.email,
      }
    );
    if (response2.statusCode == 200) {
      final List<dynamic> data = json.decode(response2.body);
    
      // Convert List<dynamic> to List<Pair<String, String>>
      tripletListT = data.map((item) {
        return Triplet<String, String, String>(
          item['fullname'] as String,
          item['profession'] as String,
          item['profilepic'] as String,
        );
      }).toList();
    } else {
      throw Exception('Failed to load favorites');
    }
    return tripletListT;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppWidgets.buildAppBar(context),
        drawer: AppWidgets.buildDrawer(context),
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
                                "Favourites",
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

                      for (int i = 0; i < favorites.length; i++)
                        Column (
                          children: [
                            TutorCardWidget (
                              rebuildCallback: rebuildScreen,
                              tutorProfilePic: favorites[i].third,
                              tutorName: favorites[i].first,
                              profession: favorites[i].second,
                            ),
                            if (i < favorites.length - 1)
                              Divider(
                                color: Color(0xFFDC2E2E),
                                thickness: 1,
                                indent: 90,
                                endIndent: 16,
                              ),
                          ]
                        ),
                      SizedBox(height: 32.0),
                    ],
                  ),
                ),
              );
            } else {
              return Center (child: CircularProgressIndicator());
            }
          }
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }
}
