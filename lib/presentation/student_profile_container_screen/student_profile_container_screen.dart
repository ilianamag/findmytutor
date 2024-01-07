import 'package:flutter/material.dart';
import 'package:login/core/app_export.dart';
import 'package:login/presentation/student_profile_page/student_profile_page.dart';
import 'package:login/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class StudentProfileContainerScreen extends StatelessWidget {
  StudentProfileContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.studentProfilePage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Search:
        return "/";
      case BottomBarEnum.Favourites:
        return "/";
      case BottomBarEnum.Messages:
        return "/";
      case BottomBarEnum.Profile:
        return AppRoutes.studentProfilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.studentProfilePage:
        return StudentProfilePage();
      default:
        return DefaultWidget();
    }
  }
}
