import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/app_bar/appbar_leading_image.dart';
import 'package:login/widgets/app_bar/appbar_title.dart';
import 'package:login/widgets/app_bar/appbar_trailing_image.dart';
import 'package:login/widgets/app_bar/custom_app_bar.dart';
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
                padding: EdgeInsets.only(left: 65.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(right: 100.h),
                        child: Text(
                          "     My",
                          style: theme.textTheme.displayMedium,
                        ),
                      ),
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
