import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:login/widgets/custom_bottom_bar_teacher.dart';
import 'package:login/widgets/appbarfortutors.dart';


class FullReviewScreen extends StatelessWidget {
  const FullReviewScreen({Key? key})
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
          padding: EdgeInsets.only(
            left: 19.h,
            top: 84.v,
            right: 19.h,
          ),
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
              SizedBox(height: 35.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgUserImagesUser,
                    height: 36.v,
                    width: 43.h,
                    radius: BorderRadius.circular(
                      18.h,
                    ),
                    margin: EdgeInsets.only(top: 12.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRatingBar(
                          initialRating: 0,
                        ),
                        SizedBox(height: 5.v),
                        Text(
                          "Student Name",
                          style: CustomTextStyles.titleMediumGray90001,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 21.v),
              Opacity(
                opacity: 0.5,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    "Comment",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
                bottomNavigationBar: _buildBottomBar2(context),
      ),
    );
  }

   Widget _buildBottomBar2(BuildContext context) {
    return CustomBottomBar2(onChanged: (BottomBarEnum2 type) {
    });
  }
}
