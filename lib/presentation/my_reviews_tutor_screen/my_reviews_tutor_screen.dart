import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/presentation/full_review_screen_teacher/full_review_screen.dart';
import 'package:login/widgets/app_bar/appbar_leading_image.dart';
import 'package:login/widgets/app_bar/appbar_title.dart';
import 'package:login/widgets/app_bar/appbar_trailing_image.dart';
import 'package:login/widgets/app_bar/custom_app_bar.dart';
import 'package:login/widgets/custom_bottom_bar_teacher.dart';
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:login/widgets/appbarfortutors.dart';
class MyReviewsTutorScreen extends StatelessWidget {
  const MyReviewsTutorScreen({Key? key})
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
          padding: EdgeInsets.symmetric(vertical: 57.v),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 96.h,
                  right: 83.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My  ",
                      style: theme.textTheme.displayMedium,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Reviews",
                        style: theme.textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 65.v),
              _buildHorizontalCard(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar2(context),

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
      margin: EdgeInsets.only(right: 1.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 3.v,
        ),
        decoration: AppDecoration.outlineGray400.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 56.v,
              width: 221.h,
              margin: EdgeInsets.only(
                left: 6.h,
                bottom: 16.v,
              ),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
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
                            "Name",
                            style: TextStyle(
                              color: appTheme.gray900,
                              fontSize: 16.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomRatingBar(
                    alignment: Alignment.topCenter,
                    initialRating: 0,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 21.v,
                bottom: 11.v,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              decoration: BoxDecoration(
                color: Color(0xFFBC121B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 1.v),
                  SizedBox(
                    width: 47.h,
                   child: GestureDetector(
                    onTap: () {
                      // Navigate to the full reviews page
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FullReviewScreen()),
                      );
                    },
                    child: Text(
                      "See Full Review",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ),
                ],
              ),
           ),
          ],
        ),
      ),
    );  
  }
   Widget _buildBottomBar2(BuildContext context) {
    return CustomBottomBar2(onChanged: (BottomBarEnum2 type) {
    });
  }
}
