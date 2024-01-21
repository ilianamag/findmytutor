import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/api_connection/api_connection.dart';
import 'package:login/models/tutor_model/tutor.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:login/models/tutor_model/tutorPreferences.dart';
import 'package:login/widgets/custom_bottom_bar_teacher.dart';
import 'package:login/widgets/appbarfortutors.dart';
import 'package:flutter_share/flutter_share.dart';

class TutorQRCode extends StatefulWidget {
  @override
  _TutorQRCodeState createState() => _TutorQRCodeState();
}

class _TutorQRCodeState extends State<TutorQRCode> {
  String name = '';
  String lastName = '';
  String email = '';
  String profileUrl = ''; // Add profileUrl

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    Tutor? tutorInfo = await RememberTutorPreferences.readTutorInfo();

    if (tutorInfo != null) {
      setState(() {
        name = tutorInfo.firstname;
        lastName = tutorInfo.lastname;
        email = tutorInfo.email;
        profileUrl = 'loginapp://VisitProfileOfTutorScreen/${"${tutorInfo.firstname} ${tutorInfo.lastname}"}';
      });
      await fetchTutorDetails(email);
    }
  }

  Future<void> fetchTutorDetails(String email) async {
    try {
      final response = await http.post(
        Uri.parse(API.myQr),
        body: {
          'email': email,
        },
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        print('Data: $data');

        if (data['success']) {
          final userData = data['userData'];
          setState(() {
            name = userData['name'];
            lastName = userData['lastname'];
            email = userData['email'];
          });
        } else {
          print('Fetch details failed');
        }
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.buildAppBar2(context),
      drawer: AppWidgets.buildDrawer2(context),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImageView(
                  data: 'Name:$name, Last Name: $lastName, Email:$email, Profile Url: $profileUrl',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  Tutor? tutorInfo = await RememberTutorPreferences.readTutorInfo();
                  String tutorProfileUrl =
                      'loginapp://TutorQRCode/${tutorInfo?.firstname}, ${tutorInfo?.lastname}';
                  await FlutterShare.share(
                    title: 'Share Tutor',
                    linkUrl: tutorProfileUrl,
                    chooserTitle: 'Share via', // Android only
                  );
                },
                child: const Icon(Icons.share),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar2(context),
    );
  }

  Widget _buildBottomBar2(BuildContext context) {
    return CustomBottomBar2(onChanged: (BottomBarEnum2 type) {});
  }
}