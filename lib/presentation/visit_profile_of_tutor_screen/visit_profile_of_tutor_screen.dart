import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_outlined_button.dart';
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart';

class VisitProfileOfTutorScreen extends StatelessWidget {
  const VisitProfileOfTutorScreen({Key? key})
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
          padding: EdgeInsets.symmetric(
            horizontal: 22.h,
            vertical: 158.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.v),
              _buildOneRow(context),
              SizedBox(height: 9.v),
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Text(
                  "See all reviews",
                  style: CustomTextStyles.titleSmallDeeporange200,
                ),
              ),
              SizedBox(height: 3.v),
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Row(
                  children: [
                    Container(
                      height: 90.v,
                      width: 92.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 13.h,
                        vertical: 9.v,
                      ),
                      decoration: AppDecoration.fillRed.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder45,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgSettings,
                        height: 57.v,
                        width: 64.h,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 26.h,
                        top: 13.v,
                        bottom: 9.v,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "First Name",
                            style: theme.textTheme.bodyLarge,
                          ),
                          SizedBox(height: 29.v),
                          Text(
                            "Last Name",
                            style: theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.v),
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Text(
                  "Περιγραφή",
                  style: CustomTextStyles.titleSmallBlack900,
                ),
              ),
              SizedBox(height: 27.v),
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Text(
                  "Description ",
                  style: CustomTextStyles.bodyLargeGray800,
                ),
              ),
              Spacer(),
              _buildThreeRow(context),
            ],
          ),
        ),
      bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
 Widget _buildOneRow(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 6.h),
    child: Row(
      children: [
        CustomRatingBar(
          initialRating: 0,
        ),
        Spacer(),
        HeartButton(), // Replacing the favorite image with the heart-shaped button
        CustomImageView(
          imagePath: ImageConstant.imgSend,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.only(left: 8.h),
        ),
      ],
    ),
  );
}

  /// Section Widget
  Widget _buildThreeRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 7.h,
        right: 4.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomOutlinedButton(
            onPressed: () {
            onTapStateLayer(context);
            },
            width: 111.h,
            text: "Make a review",
            margin: EdgeInsets.only(bottom: 3.v),
          ),
          CustomOutlinedButton(
            height: 37.v,
            width: 154.h,
            text: "Add to my tutors",
            leftIcon: Container(
              margin: EdgeInsets.only(right: 8.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgPlus,
                height: 18.adaptSize,
                width: 18.adaptSize,
              ),
            ),
          ),
        ],
      ),
    );
  } 
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }
}
    onTapStateLayer(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.makeAReviewScreen);
  }

class HeartButton extends StatefulWidget {
  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isFilled = false;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        setState(() {
          isFilled = !isFilled;
        });
      },
      child: CustomPaint(
        size: Size(24.adaptSize, 24.adaptSize),
        painter: HeartPainter(isFilled ? Colors.red : Colors.grey),
      ),
    );
  }
}

class HeartPainter extends CustomPainter {
  final Color color;

  HeartPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width / 2, size.height * 0.85);
    path.cubicTo(
      size.width * 0.2,
      size.height * 0.5,
      0,
      size.height * 0.3,
      size.width / 2,
      size.height * 0.1,
    );
    path.cubicTo(
      size.width,
      size.height * 0.3,
      size.width * 0.8,
      size.height * 0.5,
      size.width / 2,
      size.height * 0.85,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}