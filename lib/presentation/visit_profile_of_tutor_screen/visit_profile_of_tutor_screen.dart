import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:login/api_connection/api_connection.dart';
import 'package:login/core/app_export.dart';
import 'package:login/models/review_model/review.dart';
import 'package:login/models/student_model/student.dart';
import 'package:login/models/student_model/studentPreferences.dart';
import 'package:login/models/tutor_model/tutor.dart';
import 'package:login/models/tutor_model/tutorPreferences.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart' as AppbarWidget;
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:login/widgets/text_field_stateful.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marquee/marquee.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class VisitProfileOfTutorScreen extends StatefulWidget {
  const VisitProfileOfTutorScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<VisitProfileOfTutorScreen> createState() => _VisitProfileOfTutorScreenState();
}

class _VisitProfileOfTutorScreenState extends State<VisitProfileOfTutorScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController leaveAReview= TextEditingController();
  Tutor? tutorInfo;
  Student? studentInfo;
  bool favorite = false;
  bool added = false;
  late ValueNotifier<bool> enabled;
  int NoR = 0;
  int rating = 0;
  String profession = 'None Available';
  List<Review> reviews = [];

  @override
  void initState() {
    super.initState();
    enabled = ValueNotifier<bool>(_isInputValid());
    //leaveAReview.addListener(_enablePublish);
  }

  @override
  void dispose() {
    //leaveAReview.dispose();
    enabled.dispose();
    super.dispose();
  } 

  Future<void> _initializeData() async {
    tutorInfo = await RememberTutorPreferences.readTutorInfo();
    studentInfo = await RememberStudentPreferences.readStudentInfo();
    favorite = await _checkFavorite();
    NoR = await _fetchNoR();
    profession = await _rememberProf();
    added = await _checkStudTut();
    reviews = await _fetchReviews();
  }

  _enablePublish() {
    enabled.value = _isInputValid();
  }

  bool _isInputValid() {
    return leaveAReview.text.isNotEmpty && rating != 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppbarWidget.AppWidgets.buildAppBar(context),
          drawer: AppbarWidget.AppWidgets.buildDrawer(context),
          body: FutureBuilder(
            future: _initializeData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Form(
                      key: _formKey,
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Column (
                          children: [

                            //Favorites - Share Icons
                            Align (
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  StatefulBuilder(
                                    builder: (context, setState) {
                                      return IconButton(
                                        onPressed: (() {
                                          setState(() {
                                            if (!favorite) _addFavorite();
                                            else _removeFavorite();
                                          });
                                        }),
                                        icon: favorite
                                          ? Icon(Icons.favorite, size: 25, color: Colors.black)
                                          : Icon(Icons.favorite_border, size: 25, color: Colors.black)
                                      );
                                    }
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      String tutorProfileUrl = 'loginapp://VisitProfileOfTutorScreen/${"${tutorInfo?.firstname ?? ""} ${tutorInfo?.lastname ?? ""}"}';
                                      await FlutterShare.share(        
                                        title: 'Share Tutor',
                                        linkUrl: tutorProfileUrl,
                                        chooserTitle: 'Share via', // Android only
                                      );
                                    },
                                    icon: Icon(Icons.share),
                                  ),
                                ]
                              ),
                            ),

                            ///Tutor's Profile Status
                            //Profile Pic
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(32.0, 0, 0, 25.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage: NetworkImage('https://mackenziebagpiping.com/wp-content/uploads/2022/12/1.png')//tutorInfo?.profilepic ?? ""),
                                    ),

                                    //Full Name
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${tutorInfo?.firstname ?? ""} ${tutorInfo?.lastname ?? ""}",
                                              style: TextStyle(
                                                fontSize: 16.fSize,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w800
                                              ),
                                            ),
                                            SizedBox(height: 3),

                                            //Rating
                                            Row (
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomRatingBar(
                                                  alignment: Alignment.centerLeft,
                                                  initialRating: tutorInfo?.rating,
                                                ),
                                                Padding (
                                                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5.0),
                                                  child: Text (
                                                    '(${NoR})',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 16.fSize,
                                                      fontWeight: FontWeight.w400,
                                                    )
                                                  ),
                                                ),
                                              ]
                                            ),
                                            SizedBox(height: 3),

                                            //Profession - Price/hour
                                            _buildProfPPH(context),

                                          ],
                                        ),
                                      )
                                    )
                                  ],
                                )
                              )
                            ),

                            //Tutor's Information
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32.0),
                              child: Text(
                                tutorInfo?.information ?? "None Available",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.fSize,
                                )
                              ),
                            ),
                            SizedBox(height: 32.0),

                            //Add to myTutors button
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32.0),
                              child: GestureDetector (
                                onTap: () {
                                  setState(() {
                                    if (!added) _addToMyTutors();
                                    else _removeFromMyTutor();
                                  });
                                },
                                child: Container(
                                  height: 40,                      
                                  decoration: BoxDecoration(color: Color(0xFFDC2E2E), borderRadius: BorderRadius.circular(4.h)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Row (
                                      children: [
                                        added
                                        ? Icon(Icons.check, size: 25.0, color: Colors.white)
                                        : Icon(Icons.add, size: 25.0, color: Colors.white),
                                        SizedBox(width: 30.0),
                                        Text( added
                                          ? 'Added to myTutors'
                                          : 'Add to myTutors',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Roboto',
                                            fontSize: 16.fSize,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),

                            //Send an email button
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32.0),
                              child: GestureDetector (
                                onTap: () async {
                                  final Uri emailUri = Uri(
                                    scheme: "mailto",
                                    path: tutorInfo?.email,
                                  );
                                  launchUrl(emailUri);
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(color: Color(0xFFDC2E2E), borderRadius: BorderRadius.circular(4.h)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Row (
                                      children: [
                                        Icon(Icons.email_outlined, size: 25.0, color: Colors.white),
                                        SizedBox(width: 30.0),
                                        Text(
                                          'Send an Email',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Roboto',
                                            fontSize: 16.fSize,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                              ),
                            ),
                            SizedBox(height: 32.0),
                            Divider(
                              color: Color(0xFFDC2E2E),
                              thickness: 1,
                              indent: 32,
                              endIndent: 32,
                            ),
                            SizedBox(height: 14.0),

                            ///Write a Review
                            //Current user's profile pic
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 32.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                      child: CircleAvatar(
                                        radius: 32.0,
                                        backgroundImage: NetworkImage('https://mackenziebagpiping.com/wp-content/uploads/2022/12/1.png'),
                                      ),
                                    ),

                                    //PAIN
                                    Builder(
                                      builder: (context) {
                                        bool _isPublishEnabled = leaveAReview.text.isNotEmpty && rating != 0;

                                        leaveAReview.addListener(() {
                                          (context as Element).markNeedsBuild();
                                          _isPublishEnabled = leaveAReview.text.isNotEmpty && rating != 0;
                                        });

                                        return Padding(
                                          padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Column(
                                              //mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 267,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      //Rating
                                                      CustomRatingBar(
                                                        initialRating: rating,
                                                        onRatingUpdate: (newRating) {
                                                          rating = newRating;
                                                          (context as Element).markNeedsBuild();    
                                                        },
                                                      ),

                                                      //Publish button
                                                      TextButton(
                                                        onPressed: _isPublishEnabled
                                                            ? () {
                                                              _publishReview();
                                                            }
                                                            : null,
                                                        child: Text(
                                                          'Publish',
                                                          style: TextStyle(
                                                            fontFamily: 'Roboto',
                                                            fontSize: 16.fSize,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        style: TextButton.styleFrom(
                                                          foregroundColor: Color(0xFFDC2E2E),
                                                          backgroundColor: Colors.transparent,
                                                          side: BorderSide(color: Colors.transparent),
                                                          disabledBackgroundColor: Colors.transparent,
                                                          disabledForegroundColor: Colors.red[100],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                //Leave a review
                                                _buildReviewTextField(context),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              )
                            ),
                            SizedBox(height: 32.0),
                            Divider(
                              color: Color(0xFFDC2E2E),
                              thickness: 1,
                              indent: 32,
                              endIndent: 32,
                            ),
                            SizedBox(height: 32.0),

                            //See all reviews
                            for (var review in reviews)
                              Padding (
                                padding: EdgeInsets.symmetric(horizontal: 32.0),
                                child: Align (
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                            //Student's Profile pic
                                            child: CircleAvatar (
                                              radius: 18.0,
                                              backgroundImage: NetworkImage('https://mackenziebagpiping.com/wp-content/uploads/2022/12/1.png'),
                                            ),
                                          ),
                                          SizedBox(width: 10.0),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(review.studentFullname),
                                              CustomRatingBar(
                                                initialRating: review.rating,
                                                itemSize: 15.0,
                                              )
                                            ],
                                          )
                                        ]
                                      ),
                                      SizedBox(height: 10.0),
                                      Container (
                                        width: 350.0,
                                        child: ReadMoreText(
                                          review.comment,
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16.fSize,
                                          ),
                                          trimLines: 2,
                                          colorClickableText: Color(0xFFDC2E2E),
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: 'Read more',
                                          trimExpandedText: ' Read less',
                                        ),
                                      ),
                                      SizedBox(height: 32.0),
                                    ],
                                  )
                                )
                              )
                          ]
                        )
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
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }

  Widget _buildProfPPH (BuildContext context) {
    String subtitle = '$profession | ${tutorInfo?.pph ?? ""}€/hour';
    if (subtitle.length <= 25) {
      return Text (
        subtitle,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14.fSize,
          fontWeight: FontWeight.w400,
        ),
      );
    }
    else {
      return Container (
        width:220,
        height: 24,
        child: Marquee(
          text: subtitle,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14.fSize,
            fontWeight: FontWeight.w400,
          ),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          velocity: 50.0,
          accelerationDuration: Duration(seconds: 1),
          accelerationCurve: Curves.linear,
          decelerationDuration: Duration(milliseconds: 1000),
          decelerationCurve: Curves.easeOut,
          startAfter: Duration(seconds: 1),
          pauseAfterRound: Duration(seconds: 1),
          blankSpace: 100.0,
        ) 
      );
    }
  }

  Widget _buildReviewTextField(BuildContext context) {
    late FocusNode focusNode = FocusNode();
    return TextFieldStateful(
      autofocus: false,
      focusNode: focusNode,
      textStyle: TextStyle(
        color: appTheme.gray600,
        fontFamily: 'Roboto',
        fontSize: 12.fSize,
      ),
      height: 6.v,
      width: 267,
      controller: leaveAReview,
      labelText: "Leave a Review",
      labelStyle: TextStyle(
        color: appTheme.gray600,
        fontSize: 12.fSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  _addFavorite() async {
    var rest = await http.post(
      Uri.parse(API.addFavorite),
      body: {
        "stud_email": studentInfo?.email,
        "tut_email": tutorInfo?.email,
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
          favorite = true;
        });
      }
    }
  }

  _removeFavorite() async {
    var rest = await http.post(
      Uri.parse(API.removeFavorite),
      body: {
        "stud_email": studentInfo?.email,
        "tut_email": tutorInfo?.email,
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
          favorite = false;
        });
      }
    }
  }

  Future<bool> _checkFavorite() async {
    var rest = await http.post(
      Uri.parse(API.checkFavorite),
      body: {
        "stud_email": studentInfo?.email,
        "tut_email": tutorInfo?.email,
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
      if (resBody['success'] == true) return true;
      else return false;
    }
    else return false;
  }

  Future<int> _fetchNoR() async {
    var rest = await http.post(
      Uri.parse(API.fNoR),
      body: {
        "tut_email": tutorInfo?.email,
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
        return int.parse(resBody['count']);
      }
      else return 0;
    }
    else return 0;
  }

Future<String> _rememberProf() async {
  var rest = await http.post(
      Uri.parse(API.rememberProf),
      body: {
        "prof_id": tutorInfo?.prof_id.toString(),
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
        return resBody['userData'].toString();
      }
      else return 'None Available';
    }
    else return 'None Available';
  }

  _addToMyTutors() async {
    var rest = await http.post(
      Uri.parse(API.addStudTut),
      body: {
        "stud_email": studentInfo?.email,
        "tut_email": tutorInfo?.email,
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
          added = true;
        });
      }
    }
  }

  _removeFromMyTutor() async {
    var rest = await http.post(
      Uri.parse(API.removeStudTut),
      body: {
        "stud_email": studentInfo?.email,
        "tut_email": tutorInfo?.email,
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
          added = false;
        });
      }
    }
  }

  Future<bool> _checkStudTut() async {
    var rest = await http.post(
      Uri.parse(API.checkStudTut),
      body: {
        "stud_email": studentInfo?.email,
        "tut_email": tutorInfo?.email,
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
      if (resBody['success'] == true) return true;
      else return false;
    }
    else return false;
  }

  Future<List<Review>> _fetchReviews() async {
    var rest = await http.post(
      Uri.parse(API.fRevs),
      body: {
        "tut_email": tutorInfo?.email,
      }
    );

    if (rest.statusCode == 200) {
      var resBody;
      print(rest.body);
      try{
        resBody = jsonDecode(rest.body);
        List<dynamic> reviewInfo = resBody;
        List<Review> reviews = reviewInfo.map((json) => Review.fromJson(json)).toList();
        return reviews;
      }
      catch(e) {
        print(e);
        return [];
      }
    }
    else return [];
  }

  Future<void> _publishReview() async{
    var rest = await http.post(
      Uri.parse(API.pRev),
      body: {
        "stud_email": studentInfo?.email,
        "tut_email": tutorInfo?.email,
        "comment": leaveAReview.text,
        "rating": rating.toString(),
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
      if (resBody['success'] == true) setState(() {
        _updateTutInfo();
      });
    }
  }

  Future<void> _updateTutInfo() async{
    var res = await http.post(
      Uri.parse(API.searchTut),
      body: {
        "fullname": "${tutorInfo?.firstname ?? ""} ${tutorInfo?.lastname ?? ""}",
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
        Tutor tutorInfo = Tutor.fromJson(resBodyOfLogin["userData"]);
        await RememberTutorPreferences.storeTutorInfo(tutorInfo);
        setState(() {
          leaveAReview.clear();
          rating = 0;
        });
      }
    }
  }
}



//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppWidgets.buildAppBar(context),
//         drawer: AppWidgets.buildDrawer(context),
//         body: Container(
//           width: double.maxFinite,
//           padding: EdgeInsets.symmetric(
//             horizontal: 22.h,
//             vertical: 158.v,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 5.v),
//               _buildOneRow(context),
//               SizedBox(height: 9.v),
//               Padding(
//                 padding: EdgeInsets.only(left: 7.h),
//                 child: Text(
//                   "See all reviews",
//                   style: CustomTextStyles.titleSmallDeeporange200,
//                 ),
//               ),
//               SizedBox(height: 3.v),
//               Padding(
//                 padding: EdgeInsets.only(left: 7.h),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 90.v,
//                       width: 92.h,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 13.h,
//                         vertical: 9.v,
//                       ),
//                       decoration: AppDecoration.fillRed.copyWith(
//                         borderRadius: BorderRadiusStyle.circleBorder45,
//                       ),
//                       child: CustomImageView(
//                         imagePath: ImageConstant.imgSettings,
//                         height: 57.v,
//                         width: 64.h,
//                         alignment: Alignment.bottomCenter,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         left: 26.h,
//                         top: 13.v,
//                         bottom: 9.v,
//                       ),
//                       child: Column(
//                         children: [
//                           Text(
//                             "First Name",
//                             style: theme.textTheme.bodyLarge,
//                           ),
//                           SizedBox(height: 29.v),
//                           Text(
//                             "Last Name",
//                             style: theme.textTheme.bodyLarge,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 32.v),
//               Padding(
//                 padding: EdgeInsets.only(left: 7.h),
//                 child: Text(
//                   "Περιγραφή",
//                   style: CustomTextStyles.titleSmallBlack900,
//                 ),
//               ),
//               SizedBox(height: 27.v),
//               Padding(
//                 padding: EdgeInsets.only(left: 7.h),
//                 child: Text(
//                   "Description ",
//                   style: CustomTextStyles.bodyLargeGray800,
//                 ),
//               ),
//               Spacer(),
//               _buildThreeRow(context),
//             ],
//           ),
//         ),
//       bottomNavigationBar: _buildBottomBar(context),
//       ),
//     );
//   }

//   /// Section Widget
//  Widget _buildOneRow(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(right: 6.h),
//     child: Row(
//       children: [
//         CustomRatingBar(
//           initialRating: 0,
//         ),
//         Spacer(),
//         HeartButton(), // Replacing the favorite image with the heart-shaped button
//         CustomImageView(
//           imagePath: ImageConstant.imgSend,
//           height: 24.adaptSize,
//           width: 24.adaptSize,
//           margin: EdgeInsets.only(left: 8.h),
//         ),
//       ],
//     ),
//   );
// }

//   /// Section Widget
//   Widget _buildThreeRow(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: 7.h,
//         right: 4.h,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CustomOutlinedButton(
//             onPressed: () {
//             onTapStateLayer(context);
//             },
//             width: 111.h,
//             text: "Make a review",
//             margin: EdgeInsets.only(bottom: 3.v),
//           ),
//           CustomOutlinedButton(
//             height: 37.v,
//             width: 154.h,
//             text: "Add to my tutors",
//             leftIcon: Container(
//               margin: EdgeInsets.only(right: 8.h),
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgPlus,
//                 height: 18.adaptSize,
//                 width: 18.adaptSize,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   } 
//   Widget _buildBottomBar(BuildContext context) {
//     return CustomBottomBar(onChanged: (BottomBarEnum type) {
//     });
//   }
// }
//     onTapStateLayer(BuildContext context) {
//     Navigator.pushNamed(context, AppRoutes.makeAReviewScreen);
//   }

// class HeartButton extends StatefulWidget {
//   @override
//   _HeartButtonState createState() => _HeartButtonState();
// }

// class _HeartButtonState extends State<HeartButton> {
//   bool isFilled = false;

//   @override
//   Widget build(BuildContext context) {
//     return InkResponse(
//       onTap: () {
//         setState(() {
//           isFilled = !isFilled;
//         });
//       },
//       child: CustomPaint(
//         size: Size(24.adaptSize, 24.adaptSize),
//         painter: HeartPainter(isFilled ? Colors.red : Colors.grey),
//       ),
//     );
//   }
// }

// class HeartPainter extends CustomPainter {
//   final Color color;

//   HeartPainter(this.color);

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;

//     Path path = Path();
//     path.moveTo(size.width / 2, size.height * 0.85);
//     path.cubicTo(
//       size.width * 0.2,
//       size.height * 0.5,
//       0,
//       size.height * 0.3,
//       size.width / 2,
//       size.height * 0.1,
//     );
//     path.cubicTo(
//       size.width,
//       size.height * 0.3,
//       size.width * 0.8,
//       size.height * 0.5,
//       size.width / 2,
//       size.height * 0.85,
//     );

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }*/
