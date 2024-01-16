import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:login/core/app_export.dart';
import 'package:login/presentation/make_a_review_screen/make_a_review_screen.dart';
import 'package:login/presentation/reviews_of_a_tutor_screen/reviews_of_a_tutor_screen.dart';
import 'package:login/theme/app_decoration.dart';
import 'package:login/widgets/custom_rating_bar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:login/widgets/search_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_share/flutter_share.dart';
import 'package:login/presentation/visit_profile_of_tutor_screen/visit_profile_of_tutor_screen.dart';
class VisitProfileStackedCard extends StatefulWidget {
  final String additionalInfoPlaceholder;
  final String imageUrlFromDatabase;
  final String nameFromDatabase;
  final String emailFromDatabase;

  VisitProfileStackedCard(BuildContext context, {
    required this.additionalInfoPlaceholder,
    required this.imageUrlFromDatabase,
    required this.nameFromDatabase,
    required this.emailFromDatabase,
  });

  @override
  _VisitProfileStackedCardState createState() =>
      _VisitProfileStackedCardState();
}

class _VisitProfileStackedCardState extends State<VisitProfileStackedCard> {
  bool addedToFavourites = false;
  bool addedToMyTutors = false;

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
            bottom: 60.0,
            left: 16.0,
            child: Container(
              padding: EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Color(0xFFBC121B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    addedToFavourites = !addedToFavourites;
                  });
                  print('Add to favourites button pressed');
                },
                child: Text(
                  addedToFavourites
                      ? "Added to Favourites"
                      : "Add to Favourites",
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
        bottom: 60.0,
        right: 16.0,
        child: Container(
        padding: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
        color: Color(0xFFBC121B),
        borderRadius: BorderRadius.circular(20),
        ),
        child: GestureDetector(
        onTap: () {
        setState(() {
          addedToMyTutors = !addedToMyTutors;
        });
        print('Add to my Tutors button pressed');
        },
        child: Text(
          addedToMyTutors ? "Added to My Tutors" : "Add to My Tutors",
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

      Positioned(
      bottom: 0.0,  // Adjust the bottom position
      child: GestureDetector(
        onTap: () async {
          final Uri emailUri = Uri(
            scheme: "mailto",
            path: widget.emailFromDatabase,
          );
          launchUrl(emailUri);
        },
        child: Container(
         padding: EdgeInsets.only(top: 20.0),
         child: OutlinedButton(
        onPressed: () async {
          final Uri emailUri = Uri(
              scheme: "mailto", path: widget.emailFromDatabase);
          launchUrl(emailUri);
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          side: BorderSide(color: Color(0xFFBC121B), width: 3.0),
          fixedSize: Size(250.0, 45.0),
          backgroundColor: Color(0xFFBC121B),
          alignment: Alignment.center,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Container(
                width: 34.0,
                height: 34.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Icon(
                  Icons.email_outlined,
                  color: Color(0xFFBC121B),
                  size: 24.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 28.0),
              child: Text(
                widget.emailFromDatabase,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
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
          Positioned(
            top: 40.0, // Align with the top of the rating bar
            right: 0.0, // Align with the right edge
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                   context,
                    MaterialPageRoute(builder: (context) => MakeAReviewScreen()),
                  );
                },
                child: Text(
                  'Make a Review',
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
          // "See All Reviews" button at the top right
          Positioned(
            top: 80.0, // Align with the top of the rating bar
            right: 0.0, // Align with the right edge
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                   context,
                    MaterialPageRoute(builder: (context) => ReviewsOfATutorScreen()),
                  );
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
  top: 0.0,
  right: 0.0,
  child: Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: ElevatedButton(
      onPressed: () async {
        String tutorProfileUrl = 'loginapp://VisitProfileOfTutorScreen/${widget.nameFromDatabase}';
        await FlutterShare.share(        
          title: 'Share Tutor',
          linkUrl: tutorProfileUrl,
          chooserTitle: 'Share via', // Android only
        );
      },
      child: const Icon(Icons.share),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
    ),
  ),
),
        ],
      ),
    );
  }

}
