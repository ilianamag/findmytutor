import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/presentation/students_my_reviewstwo_screen/students_my_reviewstwo_screen.dart';
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart';

class StudentsMyReviewsoneScreen extends StatelessWidget {
  const StudentsMyReviewsoneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppWidgets.buildAppBar(context),
        drawer: AppWidgets.buildDrawer(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 55.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 80.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "    My",
                      style: TextStyle(
                        color: appTheme.black900,
                        fontSize: 40.fSize,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.2, 0.0),
                      child: Text(
                        "Reviews",
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
              SizedBox(height: 75.v),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentsMyReviewstwoScreen()),
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
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }
}
