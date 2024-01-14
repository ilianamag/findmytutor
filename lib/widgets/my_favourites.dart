import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';

class FavouriteCardWidget extends StatelessWidget {
  const FavouriteCardWidget({
    Key? key,
    required this.leftImagePath,
    required this.tutorName,
    required this.rightImagePath,
  }) : super(key: key);

  final String leftImagePath;
  final String tutorName;
  final String rightImagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: appTheme.gray400,
            width: 1.h,
          ),
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Container(
          height: 80.v,
          width: double.maxFinite,
          decoration: AppDecoration.outlineGray400.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(left: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.v),
                        padding: EdgeInsets.symmetric(
                          horizontal: 13.h,
                          vertical: 9.v,
                        ),
                        decoration: AppDecoration.fillRed.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.v),
                            CustomImageView(
                              imagePath: leftImagePath,
                              height: 20.v,
                              width: 20.h,
                            ),
                          ],
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
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 25.adaptSize,
                  width: 25.adaptSize,
                  margin: EdgeInsets.only(
                    left: 1.h,
                    bottom: 3.v,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 1.h),
                  decoration: AppDecoration.fillWhiteA.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFavorite,
                    height: 20.v,
                    width: 20.h,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
