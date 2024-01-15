import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_rating_bar.dart';

class ReviewSectionWidget extends StatelessWidget {
  const ReviewSectionWidget({
    Key? key,
    required this.name,
    required this.rating,
    required this.comment,
  }) : super(key: key);

  final String name;
  final int rating;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35.v),
        Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgUserImagesUser,
              height: 36.v,
              width: 43.h,
              radius: BorderRadius.circular(18.h),
              margin: EdgeInsets.only(top: 12.v),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRatingBar(
                    initialRating: rating,
                  ),
                  SizedBox(height: 5.v),
                  Text(
                    name,
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
        Text(
          comment,
          style: TextStyle(
            color: appTheme.black900,
            fontSize: 16.fSize,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
