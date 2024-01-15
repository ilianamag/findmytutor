import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_rating_bar.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({
    Key? key,
    required this.studentName,
    required this.comment,
    required this.rating,
    required this.imagePath,
  }) : super(key: key);

  final String studentName;
  final String comment;
  final int rating;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
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
                          initialRating: rating,
                        ),
                        SizedBox(height: 5.v),
                        Padding(
                          padding: EdgeInsets.only(left: 6.h),
                          child: Text(
                            studentName,
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
                              comment,
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
}
