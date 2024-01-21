import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:login/api_connection/api_connection.dart';
import 'package:login/core/app_export.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/models/student_model/student.dart';
import 'package:login/models/student_model/studentPreferences.dart';
import 'package:login/models/tutor_model/tutor.dart';
import 'package:login/models/tutor_model/tutorPreferences.dart';
import 'package:url_launcher/url_launcher.dart';

class TutorCardWidget extends StatelessWidget {
  const TutorCardWidget({
    Key? key,
    required this.tutorName,
    required this.tutorProfilePic,
    required this.profession,
    this.rebuildCallback,
  }) : super(key: key);

  final String? tutorName;
  final String? tutorProfilePic;
  final String? profession;
  final VoidCallback? rebuildCallback;

  //TutorCardWidget(this.rebuildCallback);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: InkWell (
            onTap: () {
              _navigateToProfile(context);
            },
            onLongPress: () {
              _showPopupMenu(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(tutorProfilePic ?? ""),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tutorName ?? "",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.fSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          profession ?? "",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.fSize,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ]
                    ),
                  ]
                ),
                IconButton(
                  onPressed: () => _showPopupMenu(context),
                  icon: Icon(Icons.more_vert, size: 30.0),
                ),
              ]
            ),
          ),
        ),
        //SizedBox(height: 14.0),
      ],
    );
  }

  Future<Tutor?> _createTutor (BuildContext context) async {
    var res = await http.post(
      Uri.parse(API.searchTut),
      body: {
        "fullname": tutorName,
      }
    );

    if (res.statusCode == 200) {
      var resBodyOfLogin;
      print(res.body);
      try{
        resBodyOfLogin = jsonDecode(res.body);
      }
      catch(e) {
        print(e);
      }
      if (resBodyOfLogin['success'] == true) {
        return Tutor.fromJson(resBodyOfLogin["userData"]);
      }
    }
    return null;
  }

  Future<void> _navigateToProfile(BuildContext context) async {
    Tutor tutorInfo = await _createTutor(context) ?? Tutor("", "", "", "", "", 0, 0, "", 0, 0, 0);
    await RememberTutorPreferences.storeTutorInfo(tutorInfo);
    try {
      Navigator.pushNamed(context, AppRoutes.visitProfileOfTutorScreen);
      //close(context, query);
    } catch (e) {
      print("Navigation error: $e");
    }
  }

   Future<void> _sendemail(BuildContext context) async {
    Tutor tutorInfo = await _createTutor(context) ?? Tutor("", "", "", "", "", 0, 0, "", 0, 0, 0);
    final Uri emailUri = Uri(
      scheme: "mailto",
      path: tutorInfo.email,
    );
    launchUrl(emailUri);
  }

  Future<void> _share(BuildContext context) async {
    Tutor tutorInfo = await _createTutor(context) ?? Tutor("", "", "", "", "", 0, 0, "", 0, 0, 0);
    String tutorProfileUrl = 'loginapp://VisitProfileOfTutorScreen/${"${tutorInfo.firstname} ${tutorInfo.lastname}"}';
    await FlutterShare.share(        
      title: 'Share Tutor',
      linkUrl: tutorProfileUrl,
      chooserTitle: 'Share via', // Android only
    );
  }

  Future<void> _removetutor(BuildContext context) async{
    Student? studentInfo = await RememberStudentPreferences.readStudentInfo();
    print(studentInfo?.email);
    Tutor tutorInfo = await _createTutor(context) ?? Tutor("", "", "", "", "", 0, 0, "", 0, 0, 0);
    var rest = await http.post(
      Uri.parse(API.removeTut),
      body: {
        "stud_email": studentInfo?.email,
        "tut_email": tutorInfo.email,
      }
    );

    if (rest.statusCode == 200) {
      var resBody;
      print(rest.body);
      try{
        resBody = jsonDecode(rest.body);
      }
      catch(e) {
        print(e);
      }
      if (resBody['success'] == true) {
        print('success');
      }
    }
    return rebuildCallback!();
  }

  void _showPopupMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset buttonPosition = button.localToGlobal(Offset.zero);

    String? selectedMenuItem = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx + button.size.width - 32.0,
        buttonPosition.dy + button.size.height, // Adjust this value to position the menu just below the widget
        buttonPosition.dx + button.size.width + 32.0, // Add some padding
        buttonPosition.dy + button.size.height + 10.0, // Add some padding
      ),
      items: [
        PopupMenuItem<String>(
          value: 'View Profile',
          child: Text('View Profile'),
        ),
        PopupMenuItem<String>(
          value: 'Send email',
          child: Text('Send email'),
        ),
        PopupMenuItem<String>(
          value: 'Remove from tutors',
          child: Text('Remove from tutors'),
        ),
        PopupMenuItem<String>(
          value: 'Share',
          child: Text('Share'),
        ),
      ],
    );

    if (selectedMenuItem != null) {
      print('Selected: $selectedMenuItem');
      switch (selectedMenuItem) {
        case 'View Profile':
          _navigateToProfile(context);
        break;
        case 'Send email':
          _sendemail(context);
        break;
        case 'Remove from tutors':
          _removetutor(context);
        break;
        case 'Share':
          _share(context);
        break;
      }
    }
  }
}