import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_bottom_bar_teacher.dart';
import 'package:login/widgets/appbarfortutors.dart';

class StudentsTutorProfileoneScreen extends StatelessWidget {
  const StudentsTutorProfileoneScreen({Key? key})
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
          padding: EdgeInsets.only(top: 89.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 96.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "  My",
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
                        "Students",
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
