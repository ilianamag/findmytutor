import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_bottom_bar_teacher.dart';
import 'package:login/widgets/custom_outlined_button.dart';
import 'package:login/widgets/appbarfortutors.dart';
// ignore_for_file: must_be_immutable
class TutorProfilePage extends StatelessWidget {
  const TutorProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppWidgets.buildAppBar2(context),
        drawer: AppWidgets.buildDrawer2(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 70.h,
            vertical: 36.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
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
              ),
              SizedBox(height: 61.v),
              _buildGetMyQR(context),
              SizedBox(height: 11.v),
              _buildMyReviews(context),
              SizedBox(height: 11.v),
              _buildEditProfile(context),
              SizedBox(height: 11.v),
              _buildLogout(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar2(context),
      ),
    );
  }


  /// Section Widget
  Widget _buildGetMyQR(BuildContext context) {
    return CustomOutlinedButton(
      width: 115.h,
      text: "Get My QR",
      margin: EdgeInsets.only(left: 48.h),
    );
  }

  /// Section Widget
  Widget _buildMyReviews(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: () {
        onTapStat(context);
      },
      width: 123.h,
      text: "My Reviews",
      margin: EdgeInsets.only(left: 45.h),
    );
  }

  /// Section Widget
  Widget _buildEditProfile(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: () {
        onTap(context);
      },
      width: 117.h,
      text: "Edit Profile",
      margin: EdgeInsets.only(left: 48.h),
    );
  }

  /// Section Widget
  Widget _buildLogout(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: () {
        onTapStateLayer(context);
      },
      width: 92.h,
      text: "Logout",
      margin: EdgeInsets.only(left: 62.h),
    );
  }
  void onTap(BuildContext context) {
  Navigator.pushReplacementNamed(context, AppRoutes.tutorEditProfilePage);
  }

  void onTapStateLayer(BuildContext context){
  Navigator.pushReplacementNamed(context, AppRoutes.loginPageScreen);
  }

  void onTapStat(BuildContext context){
  Navigator.pushReplacementNamed(context, AppRoutes.myReviewsTutorScreen);
  }

  Widget _buildBottomBar2(BuildContext context) {
    return CustomBottomBar2(onChanged: (BottomBarEnum2 type) {
    });
  }
}
