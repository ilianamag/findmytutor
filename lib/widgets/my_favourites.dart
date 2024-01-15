import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';

class HorizontalCardSearch extends StatelessWidget {
  final String photoUrl;
  final String name;
  final String additionalPhotoAsset; // Path to the additional photo in the project

  HorizontalCardSearch({
    required this.photoUrl,
    required this.name,
    required this.additionalPhotoAsset,
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
              height: 80.v, // Adjusted height for better fit
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
                      crossAxisAlignment: CrossAxisAlignment.center, // Adjusted to center vertically
                      children: [
                        ClipOval(
                          child: CustomImageView(
                            imagePath: photoUrl,
                            height: 70.adaptSize, // Adjusted height for better fit
                            width: 70.adaptSize, // Adjusted width for better fit
                            fit: BoxFit.cover, // or BoxFit.contain, BoxFit.fill, etc.
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.h,
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
                ],
              ),
            ),

            // Additional photo holder at the right end
            Container(
              //height: 60.adaptSize, // Adjusted height for better fit
              //width: 100.adaptSize, // Adjusted width for better fit
              margin: EdgeInsets.only(
                top: 5,
                right: 6.h,
                bottom: 5.v,
              ),
              child: CustomImageView(
                imagePath: additionalPhotoAsset,
                //height: 60.adaptSize, // Adjusted height for better fit
                width: 80.adaptSize, // Adjusted width for better fit
                fit: BoxFit.contain, // or BoxFit.contain, BoxFit.fill, etc.
              ),
            ),
          ],
        ),
      ),
    );
  }
}