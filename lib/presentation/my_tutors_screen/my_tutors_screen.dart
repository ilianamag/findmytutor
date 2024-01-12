import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/app_bar/appbar_leading_image.dart';
import 'package:login/widgets/app_bar/appbar_title.dart';
import 'package:login/widgets/app_bar/appbar_trailing_button.dart';
import 'package:login/widgets/app_bar/appbar_trailing_image.dart';
import 'package:login/widgets/app_bar/custom_app_bar.dart';
import 'package:login/widgets/custom_bottom_bar.dart';

class MyTutorsScreen extends StatelessWidget {
  const MyTutorsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        drawer: _buildDrawer(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 69.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 96.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My",
                      style: TextStyle(
                        color: appTheme.black900,
                        fontSize: 40.fSize,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
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
              _buildHorizontalCard(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Text(
      'Find My Tutor',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        color: appTheme.black900, // Replace with your color value
        fontSize: 20.fSize, // Replace with your font size
      ),
    ),
    backgroundColor: const Color(0xffF8EBEA), // Replace with your color value
    actions: [
      IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: appTheme.black900, // Replace with your color value
        ),
        onPressed: () => Navigator.pushNamed(context, AppRoutes.studentProfileScreen),
      ),
    ],
  );
}

Drawer _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          leading: Icon(
            Icons.person_outline,
            color: appTheme.black900, // Replace with your color value
          ),
          title: Text(
            'My Tutors',
            style: TextStyle(
              color: appTheme.black900, // Replace with your color value
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.myTutorsScreen);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.question_answer,
            color: appTheme.black900, // Replace with your color value
          ),
          title: Text(
            'FAQs',
            style: TextStyle(
              color: appTheme.black900, // Replace with your color value
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.faqsScreenStudent);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.qr_code,
            color: appTheme.black900, // Replace with your color value
          ),
          title: Text(
            'QR Code Scanner',
            style: TextStyle(
              color: appTheme.black900, // Replace with your color value
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            // Add your navigation logic here
          },
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: appTheme.black900, // Replace with your color value
          ),
          title: Text(
            'Logout',
            style: TextStyle(
              color: appTheme.black900, // Replace with your color value
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.loginPageScreen);
          },
        ),
      ],
    ),
  );
}

  /// Section Widget
  Widget _buildHorizontalCard(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Container(
        width: double.maxFinite,
        decoration: AppDecoration.outlineGray400.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgMonogram,
              height: 40.adaptSize,
              width: 40.adaptSize,
              margin: EdgeInsets.only(
                left: 16.h,
                top: 20.v,
                bottom: 20.v,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                top: 29.v,
                bottom: 31.v,
              ),
              child: Text(
                "Tutor Name",
                style: TextStyle(
                  color: appTheme.gray900,
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgMedia,
              height: 80.adaptSize,
              width: 80.adaptSize,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }
}
