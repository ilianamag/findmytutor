import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/reviews_of_a_tutor.dart';
import 'package:login/widgets/tutor_info.dart';


class ReviewsOfATutorScreen extends StatelessWidget {
  const ReviewsOfATutorScreen({Key? key})
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
          padding: EdgeInsets.symmetric(vertical: 49.v),
          child: Column(
            children: [
              TutorInfoWidget(
                tutorName: 'Tutor Name',
                rating: 0,
                imagePath: ImageConstant.imgMonogram,
              ),
              SizedBox(height: 79.v),
              ReviewCardWidget(
                studentName: 'john',
                comment: 'very good',
                rating: 0,
                imagePath: ImageConstant.imgMonogram,
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
