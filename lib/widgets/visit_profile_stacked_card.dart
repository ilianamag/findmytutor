import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:login/core/app_export.dart';
import 'package:login/theme/app_decoration.dart';
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class VisitProfileStackedCard extends StatefulWidget {
  final String additionalInfoPlaceholder;
  final String imageUrlFromDatabase;
  final String nameFromDatabase;

  VisitProfileStackedCard(BuildContext context, {
    required this.additionalInfoPlaceholder,
    required this.imageUrlFromDatabase,
    required this.nameFromDatabase,
  });

  @override
  _VisitProfileStackedCardState createState() =>
      _VisitProfileStackedCardState();
}

class _VisitProfileStackedCardState extends State<VisitProfileStackedCard> {
  bool addedToFavourites = false;

  @override
  Widget build(BuildContext context) {
    // Set the default initial rating for the CustomRatingBar
    int defaultInitialRating = 3; // Change this to the desired default value

    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 45.0,
            right: 180.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                  ),
                  children: [
                    TextSpan(
                      text: widget.nameFromDatabase,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // "Add to Favorites" or "Added to Favorites" button at the bottom left
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFBC121B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    addedToFavourites = !addedToFavourites;
                  });
                  print('Add to favorites button pressed');
                },
                child: Text(
                  addedToFavourites
                      ? "Added to Favorites"
                      : "Add to Favorites",
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
          // Centered text holder
          Positioned.fill(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: AppDecoration.outlineGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: widget.additionalInfoPlaceholder,
                    border: InputBorder.none,
                  ),
                  maxLines: 10,
                ),
              ),
            ),
          ),
          // Custom Rating Bar at the top left above the photo holder
          Positioned(
            top: 0.0, // Adjust the top position
            left: 5.0, // Adjust the left position
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: CustomRatingBar(
                // Use the default initial rating
                initialRating: defaultInitialRating,
                onRatingUpdate: (rating) {
                  // Handle the updated rating
                  print('Updated Rating: $rating');
                },
              ),
            ),
          ),
          // Circular photo placeholder at the center
          Positioned(
            top: 50.0, // Adjust the top position to leave space for the rating bar
            left: 20.0,
            child: Container(
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(widget.imageUrlFromDatabase),
              ),
            ),
          ),
          // "See All Reviews" button at the top right
          Positioned(
            top: 90.0, // Align with the top of the rating bar
            right: 0.0, // Align with the right edge
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Handle "See All Reviews" button press
                  print('See All Reviews button pressed');
                },
                child: Text(
                  'See All Reviews',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          // Share icon button at the top right
          Positioned(
            top: 0.0, // Align with the top of the rating bar
            right: 0.0, // Align with the right edge
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: IconButton(
                 onPressed: () async {
                  // Get the current URL dynamically
                  String currentUrl = html.window.location.href;

                  // Open the link in the browser
                  // ignore: deprecated_member_use
                  if (await canLaunch(currentUrl)) {
                    // ignore: deprecated_member_use
                    await launch(currentUrl);
                  } else {
                    throw 'Could not launch $currentUrl';
                  }
                },
                icon: Icon(Icons.share),
                color: Colors.black,
                iconSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

