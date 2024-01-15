import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/my_reviews_tutor.dart';
import 'package:login/widgets/my_tutors.dart';
import 'package:url_launcher/url_launcher.dart';
class MyTutorsScreen extends StatelessWidget {
  const MyTutorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppWidgets.buildAppBar(context),
        drawer: AppWidgets.buildDrawer(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 69.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 1.h),
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
                        "Tutors",
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
              TutorCardWidget(leftImagePath: ImageConstant.imgMonogram, tutorName: 'iliana', rightImagePath: ImageConstant.imgMedia),
              SizedBox(height: 5.v),
            ],
          ),
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
