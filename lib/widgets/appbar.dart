import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';

class AppWidgets {
  static AppBar buildAppBar(BuildContext context) {
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

  static Drawer buildDrawer(BuildContext context) {
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
            Navigator.pushNamed(context, AppRoutes.qrCode);
            // Navigator.pushNamed(context, AppRoutes.HomePage);
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
        ListTile(
          leading: Icon(
            Icons.logout,
            color: appTheme.black900, // Replace with your color value
          ),
          title: Text(
            'testing screens',
            style: TextStyle(
              color: appTheme.black900, // Replace with your color value
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.searchResultScreen);
          },
        ),
      ],
    ),
  );
  }

  static buildAppBarHomepage(BuildContext context) {}
}
