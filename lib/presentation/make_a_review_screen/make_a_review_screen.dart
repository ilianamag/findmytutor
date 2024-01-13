import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_elevated_button.dart';
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:login/widgets/custom_text_form_field.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/custom_bottom_bar.dart';

class MakeAReviewScreen extends StatelessWidget {
  MakeAReviewScreen({Key? key}) : super(key: key);

  TextEditingController reviewvalueController = TextEditingController();
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppWidgets.buildAppBar(context),
        drawer: AppWidgets.buildDrawer(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
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
              ),
              SizedBox(height: 53.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  right: 58.h,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.v),
                      child: Text(
                        "Add Rating:",
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.h),
                      child: CustomRatingBar(
                        initialRating: rating,
                        onRatingUpdate: (newRating) {
                          rating = newRating;
                          // Handle the rating update (if needed)
                          print(rating);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 39.v),
              CustomTextFormField(
                controller: reviewvalueController,
                hintText: "Review",
                textInputAction: TextInputAction.done,
                maxLines: 13,
              ),
              SizedBox(height: 80.v),
              CustomElevatedButton(
                width: 95.h,
                text: "Publish",
                margin: EdgeInsets.only(right: 10.h),
                alignment: Alignment.centerRight,
                onPressed: () {
                  // Handle the publish button press
                  print("Rating: $rating");
                  print("Review: ${reviewvalueController.text}");
                  // Add logic to publish the review
                },
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
       bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }
}
