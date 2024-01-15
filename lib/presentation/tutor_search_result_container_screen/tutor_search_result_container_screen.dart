import 'package:flutter/material.dart';

import 'package:login/widgets/custom_bottom_bar.dart';

import 'package:login/widgets/appbar.dart' as AppbarWidget;
import 'package:login/widgets/whole_card_search.dart';




class SearchResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarWidget.AppWidgets.buildAppBar(context),
        drawer: AppbarWidget.AppWidgets.buildDrawer(context),
        body: Center(
          child: ListView.builder(
            //itemCount: dataFromDatabase.length,
            itemCount: 10, // Replace with the number of WholeCardSearch widgets you want
            itemBuilder: (context, index) {
              // // Extract data for the current item
              // YourDataModel currentItem = dataFromDatabase[index];
              return Column(
                children: [
                  //YourCardWidget(data: currentItem),
                  WholeCardSearch(context),
                  SizedBox(height: 16.0), // Adjust the height according to your spacing needs
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }
}

Widget _buildBottomBar(BuildContext context) {
  return CustomBottomBar(onChanged: (BottomBarEnum type) {});
}


