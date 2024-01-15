import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/presentation/full_review_screen_teacher/full_review_screen.dart';
import 'package:login/widgets/custom_rating_bar.dart';

class HorizontalCardWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final int initialRating;

  const HorizontalCardWidget({
    required this.imagePath,
    required this.name,
    required this.initialRating,
  });

  @override
  Widget build(BuildContext context) {
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
                          imagePath: imagePath,
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
                            name,
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
                    initialRating: initialRating,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FullReviewScreen()),
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
}
