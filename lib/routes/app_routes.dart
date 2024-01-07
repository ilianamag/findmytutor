import 'package:flutter/material.dart';
import 'package:login/presentation/login_page_screen/login_page_screen.dart';
import 'package:login/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:login/presentation/student_profile_container_screen/student_profile_container_screen.dart';
import 'package:login/presentation/student_screen_one/student_screen_one.dart';
import 'package:login/presentation/student_profile_page/student_profile_page.dart';

class AppRoutes {
  static const String loginPageScreen = '/login_page_screen';

  static const String studentoneScreen = '/student_screen_one';

  static const String studentProfilePage = '/student_profile_page';

  static const String studentProfileContainerScreen = '/student_profile_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    loginPageScreen: (context) => LoginPageScreen(),
    studentProfileContainerScreen: (context) => StudentProfileContainerScreen(),
    studentProfilePage: (context) => StudentProfilePage(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    studentoneScreen: (context) => StudentoneScreen()
  };
}
