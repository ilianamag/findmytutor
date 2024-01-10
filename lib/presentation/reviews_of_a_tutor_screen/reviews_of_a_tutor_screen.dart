import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/app_bar/appbar_leading_image.dart';
import 'package:login/widgets/app_bar/appbar_title.dart';
import 'package:login/widgets/app_bar/appbar_trailing_button.dart';
import 'package:login/widgets/app_bar/appbar_trailing_image.dart';
import 'package:login/widgets/app_bar/custom_app_bar.dart';
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:login/widgets/custom_bottom_bar.dart';

class ReviewsOfATutorScreen extends StatelessWidget {
  const ReviewsOfATutorScreen({Key? key})
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
          padding: EdgeInsets.symmetric(vertical: 49.v),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 77.v,
                  width: 277.h,
                  margin: EdgeInsets.only(right: 19.h),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgMonogram,
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 7.v),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 77.v,
                          width: 270.h,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(left: 37.h),
                                  decoration:
                                      AppDecoration.outlineGray.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.customBorderTL4,
                                  ),
                                  child: Container(
                                    decoration:
                                        AppDecoration.outlineGray900.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.customBorderTL4,
                                    ),
                                    child: Container(
                                      width: 232.h,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.h,
                                        vertical: 10.v,
                                      ),
                                      child: Text(
                                        "Name",
                                        style: TextStyle(
                                          color: appTheme.gray900,
                                          fontSize: 16.fSize,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CustomRatingBar(
                                alignment: Alignment.bottomLeft,
                                initialRating: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 79.v),
              _buildReviewsOfATutor(context),
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
      leadingWidth: 41.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgMegaphone,
        margin: EdgeInsets.only(
          left: 17.h,
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
          margin: EdgeInsets.fromLTRB(12.h, 13.v, 17.h, 8.v),
           onTap: () {
          Navigator.pushReplacementNamed(context, AppRoutes.studentsMyReviewstwoScreen);
        },
        ),
        AppbarTrailingButton(
          margin: EdgeInsets.only(
            left: 29.h,
            top: 13.v,
            right: 29.h,
          ),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildReviewsOfATutor(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 1.h),
      decoration: AppDecoration.outlineGray400.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        decoration: AppDecoration.outlineGray4001.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgMonogram,
              height: 40.adaptSize,
              width: 40.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 20.v),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.h,
                  bottom: 7.v,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRatingBar(
                          initialRating: 0,
                        ),
                        SizedBox(height: 5.v),
                        Padding(
                          padding: EdgeInsets.only(left: 6.h),
                          child: Text(
                            "Student Name",
                            style: TextStyle(
                              color: appTheme.gray900,
                              fontSize: 16.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.v),
                        Opacity(
                          opacity: 0.5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 6.h),
                            child: Text(
                              "Comment",
                              style: TextStyle(
                                color: appTheme.gray900.withOpacity(0.53),
                                fontSize: 16.fSize,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 25.v,
                        bottom: 7.v,
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
                            child: Text(
                              "See Full\nReview",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: appTheme.whiteA700,
                                fontSize: 13.fSize,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
