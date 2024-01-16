import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/widgets/custom_search_delegate.dart';
import 'package:http/http.dart' as http;
import 'package:login/api_connection/api_connection.dart';
import 'dart:convert';
import 'package:login/widgets/Pair/Pair.dart';

class AppWidgetsHomepage {
  static Future<List<Pair<String, String>>> _fetchSuggestions() async {
    List<Pair<String, String>> pairListP;
    List<Pair<String, String>> pairListT;
    final response = await http.get(Uri.parse(API.fProfSug));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
    
      // Convert List<dynamic> to List<Pair<String, String>>
      pairListP = data.map((item) {
        return Pair<String, String>(
          item['profession'] as String,
          item['category'] as String,
        );
      }).toList();
    } else {
      throw Exception('Failed to load suggestions');
    }
    final response2 = await http.get(Uri.parse(API.fTutSug));
    if (response2.statusCode == 200) {
      final List<dynamic> data = json.decode(response2.body);
    
      // Convert List<dynamic> to List<Pair<String, String>>
      pairListT = data.map((item) {
        return Pair<String, String>(
          item['fullname'] as String,
          item['profession'] as String,
        );
      }).toList();
    } else {
      throw Exception('Failed to load suggestions');
    }
    final List<Pair<String, String>> pairList = pairListP + pairListT;
    return pairList;
  }

  static AppBar buildAppBarHomepage(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Find My Tutor',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          color: appTheme.black900,
          fontSize: 20.fSize,
        ),
      ),
      backgroundColor: const Color(0xffFF8EBEA),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: appTheme.black900,
          ),
          onPressed: () async {
            List<Pair<String, String>> suggestions = await _fetchSuggestions();
            showSearch(context: context, delegate: CustomSearchDelegate(suggestions),
            );
            // Add your search functionality here
          },
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: appTheme.black900,
          ),
          onPressed: () => Navigator.pushNamed(context, AppRoutes.studentProfileScreen),
        ),
      ],
    );
  }

  static Drawer buildDrawerHomepage(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: Icon(
              Icons.person_outline,
              color: appTheme.black900,
            ),
            title: Text(
              'My Tutors',
              style: TextStyle(
                color: appTheme.black900,
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
              color: appTheme.black900,
            ),
            title: Text(
              'FAQs',
              style: TextStyle(
                color: appTheme.black900,
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
              color: appTheme.black900,
            ),
            title: Text(
              'QR Code Scanner',
              style: TextStyle(
                color: appTheme.black900,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.qrCode);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: appTheme.black900,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                color: appTheme.black900,
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
}
