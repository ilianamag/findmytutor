import 'package:flutter/material.dart';
import 'package:login/presentation/FAQs/faqs_student.dart';
import 'package:login/presentation/full_review_screen_teacher/full_review_screen.dart';
import 'package:login/presentation/login_page_screen/login_page_screen.dart';
import 'package:login/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:login/presentation/student_profile_screen/student_profile_screen.dart';
import 'package:login/presentation/student_screen_one/student_screen_one.dart';
import 'package:login/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:login/presentation/edit_profile_of_student_page/edit_profile_of_student_page.dart';
import 'package:login/presentation/student_profile_screen/student_profile_screen.dart';
import 'package:login/presentation/students_my_reviewsone_screen/students_my_reviewsone_screen.dart';
import 'package:login/presentation/students_my_reviewstwo_screen/students_my_reviewstwo_screen.dart';
import 'package:login/presentation/reviews_of_a_tutor_screen/reviews_of_a_tutor_screen.dart';
import 'package:login/presentation/my_tutors_screen/my_tutors_screen.dart';
import 'package:login/presentation/my_favourites_screen/my_favourites_screen.dart';
import 'package:login/presentation/FAQs/faqs_student.dart';
import 'package:login/presentation/tutor_profile_page/tutor_profile_page.dart';
import 'package:login/presentation/my_students/students_tutor_profileone_screen.dart';
import 'package:login/presentation/my_reviews_tutor_screen/my_reviews_tutor_screen.dart';
import 'package:login/presentation/full_review_screen_teacher/full_review_screen.dart';


class AppRoutes {
  static const String loginPageScreen = '/login_page_screen';

  static const String faqsScreenStudent = '/faqs_student';

  static const String myTutorsScreen = '/my_tutors_screen';

  static const String studentsMyReviewstwoScreen = '/students_my_reviewstwo_screen';

  static const String tutorEditProfilePage = '/tutor_edit_profile_page';

  static const String studentoneScreen = '/student_screen_one';

  static const String studentProfileScreen = '/student_profile_screen';

  static const String reviewsOfATutorScreen = '/reviews_of_a_tutor_screen';

  static const String editProfileOfStudentPage = '/edit_profile_of_student_page';

  static const String appNavigationScreen = '/app_navigation_screen';
  
  static const String studentsMyReviewsoneScreen = '/students_my_reviewsone_screen';

  static const String myFavouritesScreen = '/my_favourites_screen';
  
  static const String tutorProfilePage = '/tutor_profile_page';
  
  static const String myReviewsTutorScreen = '/my_reviews_tutor_screen';

  static const String studentsTutorProfileoneScreen = '/students_tutor_profileone_screen';
 
  static const String fullReviewScreen = '/full_review_screen';
  
  static Map<String, WidgetBuilder> routes = {
    fullReviewScreen: (context) => FullReviewScreen(),
    myReviewsTutorScreen: (context) => MyReviewsTutorScreen(),
    studentsTutorProfileoneScreen: (context) => StudentsTutorProfileoneScreen(),
    tutorProfilePage: (context) => TutorProfilePage(),
    tutorEditProfilePage : (context) => TutorProfilePage(),
    faqsScreenStudent :(context) => FaqsScreen(),
    myFavouritesScreen: (context) => MyFavouritesScreen(),
    studentsMyReviewsoneScreen: (context) => StudentsMyReviewsoneScreen(),
    editProfileOfStudentPage: (context) => EditProfileOfStudentPage(),
    reviewsOfATutorScreen:(context) => ReviewsOfATutorScreen(),
    studentsMyReviewstwoScreen: (context) => StudentsMyReviewstwoScreen(),
    myTutorsScreen: (context) => MyTutorsScreen(),
    loginPageScreen: (context) => LoginPageScreen(),
    studentProfileScreen: (context) => StudentProfileScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    studentoneScreen: (context) => StudentoneScreen(),
  };
}
