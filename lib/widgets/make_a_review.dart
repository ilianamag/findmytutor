import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_elevated_button.dart';
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:login/widgets/custom_text_form_field.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/presentation/students_my_reviewsone_screen/students_my_reviewsone_screen.dart';
class RatingAndReviewWidget extends StatefulWidget {
  const RatingAndReviewWidget({Key? key}) : super(key: key);

  @override
  _RatingAndReviewWidgetState createState() => _RatingAndReviewWidgetState();
}

class _RatingAndReviewWidgetState extends State<RatingAndReviewWidget> {
  int rating = 0;
  TextEditingController reviewvalueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                    setState(() {
                      rating = newRating;
                    });
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
        SizedBox(height: 15.v),
        CustomElevatedButton(
          width: 95.h,
          text: "Publish",
          margin: EdgeInsets.only(right: 10.h),
          alignment: Alignment.centerRight,
          onPressed: () {
            print("Rating: $rating");
            print("Review: ${reviewvalueController.text}");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentsMyReviewsoneScreen()),
            );
          },
          buttonTextStyle: TextStyle(
            color: Colors.white, // Text color
          ),
        ),
        SizedBox(height: 5.v),
      ],
    );
  }
}

