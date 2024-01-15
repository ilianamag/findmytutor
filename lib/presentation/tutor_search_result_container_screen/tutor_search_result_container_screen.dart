import 'package:flutter/material.dart';

import 'package:login/widgets/custom_bottom_bar.dart';

import 'package:login/widgets/appbar.dart' as AppbarWidget;
import 'package:login/widgets/whole_card_search.dart';

class SearchResultScreen extends StatefulWidget {
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  String _selectedSortOption = 'Best Rated';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarWidget.AppWidgets.buildAppBar(context),
        drawer: AppbarWidget.AppWidgets.buildDrawer(context),
        body: Column(
          children: [
            _buildSortDropdown(),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      WholeCardSearch(context),
                      SizedBox(height: 16.0),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildSortDropdown() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sort By:'),
          SizedBox(width: 10),
          DropdownButton<String>(
            value: _selectedSortOption,
            onChanged: (String? newValue) {
              setState(() {
                _selectedSortOption = newValue!;
                // Implement your sorting logic here based on _selectedSortOption
              });
            },
            items: ['Best Rated', 'Lowest Price', 'Highest Price']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }
}
