import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/app_bar/appbar_leading_image.dart';
import 'package:login/widgets/app_bar/appbar_title.dart';
import 'package:login/widgets/app_bar/appbar_trailing_image.dart';
import 'package:login/widgets/app_bar/custom_app_bar.dart';
import 'package:login/widgets/custom_bottom_bar_teacher.dart';

class StudentsTutorProfileoneScreen extends StatelessWidget {
  const StudentsTutorProfileoneScreen({Key? key})
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
          padding: EdgeInsets.only(top: 89.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 87.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(right: 120.h),
                        child: Text(
                          "My  ",
                          style: theme.textTheme.displayMedium,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.h),
                        child: Text(
                          "Students",
                          style: theme.textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.v),
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
          margin: EdgeInsets.fromLTRB(62.h, 18.v, 92.h, 20.v),
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
        padding: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 19.v,
        ),
        decoration: AppDecoration.outlineGray400.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgMonogram,
              height: 40.adaptSize,
              width: 40.adaptSize,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                top: 9.v,
                bottom: 11.v,
              ),
              child: Text(
                "Student Name",
                style: theme.textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar2(onChanged: (BottomBarEnum2 type) {
    });
  }
}
