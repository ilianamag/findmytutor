import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/app_bar/appbar_leading_image.dart';
import 'package:login/widgets/app_bar/appbar_title.dart';
import 'package:login/widgets/app_bar/appbar_trailing_button.dart';
import 'package:login/widgets/app_bar/appbar_trailing_image.dart';
import 'package:login/widgets/app_bar/custom_app_bar.dart';
import 'package:login/widgets/custom_outlined_button.dart';
import 'package:login/widgets/custom_bottom_bar.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        drawer: _buildDrawer(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 38.h,
            top: 41.v,
            bottom: 41.v,
          ),
          child: Column(
            children: [
              Container(
                height: 200.adaptSize,
                width: 200.adaptSize,
                padding: EdgeInsets.symmetric(
                  horizontal: 29.h,
                  vertical: 21.v,
                ),
                decoration: AppDecoration.fillRed.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder100,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgAvatarPlaceholder,
                  height: 128.v,
                  width: 140.h,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              SizedBox(height: 60.v),
              _buildMyTutors(context),
              SizedBox(height: 9.v),
              _buildMyReviews(context),
              SizedBox(height: 9.v),
              _buildEditProfile(context),
              SizedBox(height: 9.v),
              _buildLogout(context),
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

  Widget _buildMyTutors(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: () {
        onTapStatel(context);
      },
      width: 111.h,
      text: "My Tutors",
    );
  }

  Widget _buildMyReviews(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: () {
        onTapState(context);
      },
      width: 123.h,
      text: "My Reviews",
    );
  }

  Widget _buildEditProfile(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: () {
        onTap(context);
      },
      width: 117.h,
      text: "Edit Profile",
    );
  }

  Widget _buildLogout(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: () {
        onTapStateLayer(context);
      },
      width: 92.h,
      text: "Logout",
    );
  }

  void onTapStateLayer(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.loginPageScreen);
  }

  void onTap(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.editProfileOfStudentPage);
  }

  void onTapState(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.studentsMyReviewsoneScreen);
  }
  void onTapStatel(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.myTutorsScreen);
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      // You can handle the navigation logic in the CustomBottomBar widget
      // instead of doing it in the StudentProfileScreen widget.
      // This callback will be triggered when a bottom bar item is tapped.
    });
  }
}
      