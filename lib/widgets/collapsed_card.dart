import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:login/api_connection/api_connection.dart';
import 'package:login/core/app_export.dart';
import 'package:login/models/student_model/student.dart';
import 'package:login/models/student_model/studentPreferences.dart';
import 'package:login/models/tutor_model/tutor.dart';
import 'package:login/models/tutor_model/tutorPreferences.dart';
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CollapsedProfileCard extends StatefulWidget {
  const CollapsedProfileCard({
    super.key,
    required this.email,
    required this.fullname,
    required this.pph,
    required this.rating,
    required this.information,
    required this.profilepic,
    required this.initFavorite,
    });

    final String? email;
    final String? fullname;
    final int? pph;
    final int? rating;
    final String? information;
    final String? profilepic;
    final bool? initFavorite;

  @override
  State<CollapsedProfileCard> createState() => _CollapsedProfileCardState(initFavorite ?? false);
}

class _CollapsedProfileCardState extends State<CollapsedProfileCard> {
  bool isFavorite;

  _CollapsedProfileCardState(this.isFavorite);

  _addFavorite() async {
    Student? studentInfo = await RememberStudentPreferences.readStudentInfo();
    var rest = await http.post(
      Uri.parse(API.addFavorite),
      body: {
        "stud_email": studentInfo?.email,
        "tut_email": widget.email,
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
        setState(() {
          isFavorite = true;
        });
      }
    }
  }

  _removeFavorite() async {
    Student? studentInfo = await RememberStudentPreferences.readStudentInfo();
    var rest = await http.post(
      Uri.parse(API.removeFavorite),
      body: {
        "stud_email": studentInfo?.email,
        "tut_email": widget.email,
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
        setState(() {
          isFavorite = false;
        });
      }
    }
  }
  
  Future<void> _share(BuildContext context) async {
    String tutorProfileUrl = 'loginapp://VisitProfileOfTutorScreen/${widget.fullname ?? ""}';
    await FlutterShare.share(        
      title: 'Share Tutor',
      linkUrl: tutorProfileUrl,
      chooserTitle: 'Share via', // Android only
    );
  }

  Future<Tutor?> _createTutor (BuildContext context) async {
    var res = await http.post(
      Uri.parse(API.searchTut),
      body: {
        "fullname": widget.fullname,
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
  }

  _navigate(BuildContext context) async {
    Tutor tutorInfo = await _createTutor(context) ?? Tutor("", "", "", "", "", 0, 0, "", 0, 0, 0);
    await RememberTutorPreferences.storeTutorInfo(tutorInfo);
    try {
      Navigator.pushNamed(context, AppRoutes.visitProfileOfTutorScreen);
      //close(context, query);
    } catch (e) {
      print("Navigation error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding (
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap:() {
                _navigate(context);
              },
              child: Container(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Stack(
                      children: [
                        Image.network(
                          'https://mackenziebagpiping.com/wp-content/uploads/2022/12/1.png',//tutorInfo?.profilepic ?? "",
                          width: 400.0,
                          height: 250.0,
                          fit:BoxFit.cover
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                            child: Material (
                              type: MaterialType.transparency,
                              child: Row (
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomRatingBar(
                                    initialRating: widget.rating,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 135.0),
                                  Container(
                                    child: Row (
                                      children: [
                                        IconButton(
                                          onPressed: (() {
                                            setState(() {
                                              if (!isFavorite) _addFavorite();
                                              else _removeFavorite();
                                            });
                                          }),
                                          icon: isFavorite
                                          ? Icon(Icons.favorite, size: 25.0, color: Colors.white)
                                          : Icon(Icons.favorite_border, size: 25.0, color: Colors.white),
                                        ),
                                        IconButton(
                                          onPressed: (() {
                                            _share(context);
                                          }),
                                          icon: Icon(Icons.share, size: 25.0, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]
                              ),
                            ),
                          )
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Padding (
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.fullname ?? "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 16.fSize,
                                    fontWeight: FontWeight.w800
                                  ),
                                ),
                                Text(
                                  '${widget.pph ?? ""}€/hour',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 14.fSize,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                Container (
                                  width: 350.0,
                                  child: ReadMoreText(
                                    widget.information ?? "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                      fontSize: 13.fSize,
                                      fontWeight: FontWeight.w400
                                    ),
                                    trimLines: 1,
                                    colorClickableText: Colors.white,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: '',
                                    trimExpandedText: '',
                                  ),
                                ),
                              ]
                            ),
                          ),
                        )
                      ]
                    ),
                  )
                ),
              ),
            ),
          );
  }
}