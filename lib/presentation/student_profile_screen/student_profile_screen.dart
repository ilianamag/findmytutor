import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/custom_outlined_button.dart';
import 'package:login/widgets/custom_bottom_bar.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      appBar: AppWidgets.buildAppBar(context),
      drawer: AppWidgets.buildDrawer(context),
      body: Center(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.start, // Align children at the top
children: [
  Container(
    width: double.maxFinite,
    padding: EdgeInsets.only(
      left: 10.h,
      top: 41.v,
      bottom: 41.v,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 70.0, // Adjust as needed
            backgroundColor: AppDecoration.fillRed.color,          child: CustomImageView(
            imagePath: ImageConstant.imgAvatarPlaceholder,
            height: 130.v,
            width: 80.h,
            alignment: Alignment.bottomCenter,
          ),
        ),
        SizedBox(height: 60.v),
        _buildMyTutors(context),
        SizedBox(height: 9.v),
        _buildEditProfile(context),
        SizedBox(height: 9.v),
        _buildLogout(context),
        SizedBox(height: 5.v),
      ],
    ),
  ),
],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
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
  void onTapStatel(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.myTutorsScreen);
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }
}