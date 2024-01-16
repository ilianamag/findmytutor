import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/presentation/students_my_reviewsone_screen/students_my_reviewsone_screen.dart';
import 'package:login/widgets/custom_elevated_button.dart';
import 'package:login/widgets/custom_rating_bar.dart';

class ReviewSectionWidget extends StatelessWidget {
  const ReviewSectionWidget({
    Key? key,
    required this.backgroundImagePath,
    required this.rating,
    required this.reviewText,
  }) : super(key: key);

  final String backgroundImagePath;
  final int rating;
  final String reviewText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
          imagePath: backgroundImagePath,
          height: 87.v,
          width: 88.h,
          radius: BorderRadius.circular(44.h),
        ),
        SizedBox(height: 22.v),
        CustomRatingBar(
          initialRating: rating,
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
        _buildStackedCard(context, reviewText),
        SizedBox(height: 50.v),
        CustomElevatedButton(
          buttonTextStyle: TextStyle(color: Colors.white),
          width: 96.h,
          text: "See my \nreviews",
          margin: EdgeInsets.only(right: 8.h),
          alignment: Alignment.centerRight,
          onPressed: () {
            // Navigate to the ReviewsOfATutorScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentsMyReviewsoneScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildStackedCard(BuildContext context, String reviewText) {
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
                reviewText,
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
}
