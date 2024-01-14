import 'package:flutter/material.dart';
import 'package:login/widgets/appbar.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/carousel.dart';
import 'package:login/widgets/appbar_homepage.dart';
class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgetsHomepage.buildAppBarHomepage(context),
      drawer: AppWidgetsHomepage.buildDrawerHomepage(context),
      body: CategoryList(), // Include the HomePage widget here
      bottomNavigationBar: _buildBottomBar(context),
    );
  }
}
Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }

// class CategoryItemWidget extends StatelessWidget {
//   CategoryItemWidget({
//     Key? key,
//     this.onTapImgImage,
//   }) : super(key: key);