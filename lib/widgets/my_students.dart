import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login/api_connection/api_connection.dart';
import 'package:login/core/app_export.dart';
import 'package:login/models/student_model/student.dart';
import 'package:http/http.dart' as http;
import 'package:login/models/tutor_model/tutor.dart';
import 'package:login/models/tutor_model/tutorPreferences.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentCardWidget extends StatelessWidget {
  final String studentName;
  final String studentProfilePic;
  final VoidCallback? rebuildCallback;

  StudentCardWidget({
    required this.studentName,
    required this.studentProfilePic,
    this.rebuildCallback,
  });
  

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
                      backgroundImage: NetworkImage(studentProfilePic),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          studentName,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.fSize,
                            fontWeight: FontWeight.w500,
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
      ],
    );
  }

  Future<Student?> _createStudent (BuildContext context) async {
    var res = await http.post(
      Uri.parse(API.searchStud),
      body: {
        "fullname": studentName,
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
        return Student.fromJson(resBodyOfLogin["userData"]);
      }
    }
    return null;
  }


    Future<void> _sendemail(BuildContext context) async {
    Student studentInfo = await _createStudent(context) ?? Student("", "", "", "", "");
    final Uri emailUri = Uri(
      scheme: "mailto",
      path: studentInfo.email,
    );
    launchUrl(emailUri);
  }


    Future<void> _removestudent(BuildContext context) async{
    Tutor? tutorInfo = await RememberTutorPreferences.readTutorInfo();
    print(tutorInfo?.email);
    Student studentInfo = await _createStudent(context) ?? Student("", "", "", "", "");
    var rest = await http.post(
      Uri.parse(API.removeStud),
      body: {
        "tut_email": tutorInfo?.email,
        "stud_email": studentInfo.email,
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
          value: 'Send email',
          child: Text('Send email'),
        ),
        PopupMenuItem<String>(
          value: 'Remove from students',
          child: Text('Remove from students'),
        ),
      ],
    );

     if (selectedMenuItem != null) {
      print('Selected: $selectedMenuItem');
      switch (selectedMenuItem) {
        case 'Send email':
          _sendemail(context);
        break;
        case 'Remove from tutors':
          _removestudent(context);
        break;
      }
    }
  }
}