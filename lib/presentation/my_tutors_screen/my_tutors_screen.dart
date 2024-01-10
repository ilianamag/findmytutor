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
          onTap: () {
            Navigator.pushReplacementNamed(context, AppRoutes.studentProfileScreen);
          },
        ),
        AppbarTrailingButton(
          margin: EdgeInsets.only(
            left: 29.h,
            top: 13.v,
            right: 30.h,
          ),
        ),
      ],
      styleType: Style.bgFill,
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
