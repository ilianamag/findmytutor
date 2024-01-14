import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';


class StackedCardSearch extends StatelessWidget {
  final String additionalInfoPlaceholder;

  StackedCardSearch({
    required this.additionalInfoPlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter, // Align to the bottom center
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.all(16.0),
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: additionalInfoPlaceholder,
                  border: InputBorder.none, // Remove the border
                ),
                maxLines: 10,
              ),
            ),
          ],
        ),
        // "Add to Favorites" button at the bottom left
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color(0xFFBC121B),
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
              onTap: () {
                // Add to favorites action
                print('Add to favorites button pressed');
              },
              child: Text(
                "Add to Favorites",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        // "Visit Profile" button at the bottom right
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color(0xFFBC121B),
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
              onTap: () {
                // Navigate to the profile page
                print('Visit Profile button pressed');
              },
              child: Text(
                "Visit Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}