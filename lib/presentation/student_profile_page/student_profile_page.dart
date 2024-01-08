import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/app_bar/appbar_leading_image.dart';
import 'package:login/widgets/app_bar/appbar_title.dart';
import 'package:login/widgets/app_bar/appbar_trailing_button.dart';
import 'package:login/widgets/app_bar/appbar_trailing_image.dart';
import 'package:login/widgets/app_bar/custom_app_bar.dart';
import 'package:login/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 18.h,
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 37.h),
                child: Column(
                  children: [
                    _buildMyTutors(context),
                    SizedBox(height: 9.v),
                    _buildMyReviews(context),
                    SizedBox(height: 9.v),
                    _buildEditProfile(context),
                    SizedBox(height: 9.v),
                    _buildLogout(context),
                  ],
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgMegaphone,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 19.v,
          bottom: 19.v,
        ),
      ),
      title: AppbarTitle(
        text: "FindmyTutor",
        margin: EdgeInsets.only(left: 18.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.fromLTRB(13.h, 13.v, 17.h, 8.v),
        ),
        AppbarTrailingButton(
          margin: EdgeInsets.only(
            left: 20.h,
            top: 13.v,
            right: 30.h,
          ),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildMyTutors(BuildContext context) {
    return CustomOutlinedButton(
      width: 111.h,
      text: "My Tutors",
    );
  }

  /// Section Widget
  Widget _buildMyReviews(BuildContext context) {
    return CustomOutlinedButton(
      width: 123.h,
      text: "My Reviews",
    );
  }

  /// Section Widget
  Widget _buildEditProfile(BuildContext context) {
    return CustomOutlinedButton(
      width: 117.h,
      text: "Edit Profile",
    );
  }

  /// Section Widget
  Widget _buildLogout(BuildContext context) {
    return CustomOutlinedButton(
      width: 92.h,
      text: "Logout",
    );
  }
}
