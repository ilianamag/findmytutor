import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
class MyFavouritesScreen extends StatelessWidget {
  const MyFavouritesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppWidgets.buildAppBar(context),
        drawer: AppWidgets.buildDrawer(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 57.v),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 70.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "My",
                          style: TextStyle(
                            color: appTheme.black900,
                            fontSize: 40.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "   Favourites",
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
              ),
              SizedBox(height: 55.v),
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
                            Text(
                              "A",
                              style: TextStyle(
                                color: appTheme.gray50,
                                fontSize: 12.fSize,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
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
                          "Tutor Name",
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
                        imagePath: ImageConstant.imgMedia,
                        height: 80.adaptSize,
                        width: 80.adaptSize,
                      ),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgIconsStarBorder,
                height: 24.adaptSize,
                width: 24.adaptSize,
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(
                  left: 0.h,
                  bottom: 4.v,
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
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      // You can handle the navigation logic in the CustomBottomBar widget
      // instead of doing it in the StudentProfileScreen widget.
      // This callback will be triggered when a bottom bar item is tapped.
    });
  }
}
