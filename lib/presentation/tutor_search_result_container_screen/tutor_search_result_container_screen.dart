import 'package:flutter/material.dart';
import 'package:login/routes/app_routes.dart';

import 'package:login/widgets/custom_bottom_bar.dart';

import 'package:login/widgets/appbar.dart' as AppbarWidget;
import 'package:login/widgets/whole_card_search.dart';




class SearchResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppbarWidget.AppWidgets.buildAppBar(context),
        drawer: AppbarWidget.AppWidgets.buildDrawer(context),
        body: Center(
          child: WholeCardSearch(context)
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }
}


Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
    });
  }

