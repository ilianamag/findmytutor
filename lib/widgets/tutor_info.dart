import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/custom_rating_bar.dart';


class TutorInfoWidget extends StatelessWidget {
  const TutorInfoWidget({
    Key? key,
    required this.tutorName,
    required this.rating,
    required this.imagePath,
  }) : super(key: key);

  final String tutorName;
  final int rating;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 77.v,
        width: 277.h,
        margin: EdgeInsets.only(right: 19.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: imagePath,
              height: 40.adaptSize,
              width: 40.adaptSize,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 7.v),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 77.v,
                width: 270.h,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(left: 37.h),
                        decoration: AppDecoration.outlineGray.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL4,
                        ),
                        child: Container(
                          decoration: AppDecoration.outlineGray900.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderTL4,
                          ),
                          child: Container(
                            width: 232.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.h,
                              vertical: 10.v,
                            ),
                            child: Text(
                              tutorName,
                              style: TextStyle(
                                color: appTheme.gray900,
                                fontSize: 16.fSize,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomRatingBar(
                      alignment: Alignment.bottomLeft,
                      initialRating: rating,
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
