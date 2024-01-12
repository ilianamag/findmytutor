import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
class FaqsScreen extends StatelessWidget {
  const FaqsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        drawer: _buildDrawer(context), 
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 16.h,
            top: 94.v,
            right: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "FAQs",
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 40.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 66.v),
              Text(
                "Μπορώ να επικοινωνήσω με τον καθηγητή;",
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8.v),
              Container(
                width: 310.h,
                margin: EdgeInsets.only(right: 17.h),
                child: Text(
                  "Ναι, πατώντας Visit Profile στο προφιλ του καθηγητή σου δίνεται η δυνατότητα να επικοινωνήσεις μαζί του με το Send a message.",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 16.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 25.v),
              Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Text(
                  "Πώς μπορώ να επιλέξω χόμπυ;",
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 16.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 21.v),
              Container(
                width: 306.h,
                margin: EdgeInsets.only(right: 21.h),
                child: Text(
                  "Πατώντας το tab “Search” στην κάτω μπάρα της οθόνης μπορείτε να περιηγηθείτε σε όλες τις κατηγορίες και τα χόμπυ που είναι διαθέσιμα στο Find my Tutor ή, εναλλακτικά, μπορείτε να το αναζητήσετε απευθείας, εάν είστε σίγουροι, πληκτρολογώντας στο ενδεικνυόμενο πλαίσιο.",
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 16.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }
AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Text(
      'Find My Tutor',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        color: appTheme.black900, // Replace with your color value
        fontSize: 20.fSize, // Replace with your font size
      ),
    ),
    backgroundColor: const Color(0xffF8EBEA), // Replace with your color value
    actions: [
      IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: appTheme.black900, // Replace with your color value
        ),
        onPressed: () => Navigator.pushNamed(context, AppRoutes.studentProfileScreen),
      ),
    ],
  );
}

Drawer _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          leading: Icon(
            Icons.person_outline,
            color: appTheme.black900, // Replace with your color value
          ),
          title: Text(
            'My Tutors',
            style: TextStyle(
              color: appTheme.black900, // Replace with your color value
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.myTutorsScreen);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.question_answer,
            color: appTheme.black900, // Replace with your color value
          ),
          title: Text(
            'FAQs',
            style: TextStyle(
              color: appTheme.black900, // Replace with your color value
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.faqsScreenStudent);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.qr_code,
            color: appTheme.black900, // Replace with your color value
          ),
          title: Text(
            'QR Code Scanner',
            style: TextStyle(
              color: appTheme.black900, // Replace with your color value
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            // Add your navigation logic here
          },
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: appTheme.black900, // Replace with your color value
          ),
          title: Text(
            'Logout',
            style: TextStyle(
              color: appTheme.black900, // Replace with your color value
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.loginPageScreen);
          },
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