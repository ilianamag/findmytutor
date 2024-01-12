import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/presentation/reviews_of_a_tutor_screen/reviews_of_a_tutor_screen.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/custom_elevated_button.dart';
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:login/widgets/custom_bottom_bar.dart';

class StudentsMyReviewstwoScreen extends StatelessWidget {
  const StudentsMyReviewstwoScreen({Key? key})
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
          padding: EdgeInsets.symmetric(vertical: 13.v),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 9.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "My  ",
                          style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 25.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Reviews",
                          style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 25.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgBackground,
                height: 87.v,
                width: 88.h,
                radius: BorderRadius.circular(
                  44.h,
                ),
              ),
              SizedBox(height: 22.v),
              CustomRatingBar(
                initialRating: 0,
              ),
              SizedBox(height: 46.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Text(
                    "My Rating:",
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 20.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.v),
              _buildStackedCard(context),
              SizedBox(height: 50.v),
              CustomElevatedButton(
                buttonTextStyle: TextStyle(color: Colors.white),
                width: 96.h,
                text: "See all \nreviews",
                margin: EdgeInsets.only(right: 8.h),
                alignment: Alignment.centerRight,
                onPressed: () {
                // Navigate to the ReviewsOfATutorScreen
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewsOfATutorScreen()),);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }


  /// Section Widget
  Widget _buildStackedCard(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 14.v,
        ),
        decoration: AppDecoration.outlineGray400.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Container(
          margin: EdgeInsets.only(right: 246.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Review:",
                style: TextStyle(
                  color: appTheme.gray900,
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40.v),
              Text(
                "Text",
                style: TextStyle(
                  color: appTheme.gray800,
                  fontSize: 14.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }
}
