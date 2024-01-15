import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/my_reviews_tutor.dart';

class TutorCardWidget extends StatelessWidget {
  const TutorCardWidget({
    Key? key,
    required this.tutorName,
    required this.leftImagePath,
    required this.rightImagePath,
  }) : super(key: key);

  final String tutorName;
  final String leftImagePath;
  final String rightImagePath;

  @override
  Widget build(BuildContext context) {
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
              imagePath: leftImagePath,
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
                tutorName,
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
              imagePath: rightImagePath,
              height: 80.adaptSize,
              width: 80.adaptSize,
            ),
          ],
        ),
      ),
    );
  }
}
