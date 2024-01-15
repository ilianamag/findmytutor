import 'package:flutter/material.dart';
import 'package:login/widgets/custom_bottom_bar.dart';
import 'package:login/widgets/appbar.dart' as AppbarWidget;
import 'package:login/widgets/whole_card_search.dart';

class Tutor {
  final String name;
  final double price;
  final double rating;

  Tutor({required this.name, required this.price, required this.rating});
}

class SearchResultScreen extends StatefulWidget {
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  String _selectedSortOption = 'Best Rated';

  List<Tutor> _tutors = [
    Tutor(name: 'John Doe', price: 30.0, rating: 4.5),
    Tutor(name: 'Jane Smith', price: 25.0, rating: 4.0),
    Tutor(name: 'Alice Johnson', price: 35.0, rating: 4.8),
    Tutor(name: 'Bob Anderson', price: 22.0, rating: 3.5),
    Tutor(name: 'Eva Williams', price: 40.0, rating: 4.2),
    Tutor(name: 'Mike Davis', price: 28.0, rating: 4.7),
    Tutor(name: 'Olivia Wilson', price: 33.0, rating: 4.6),
    Tutor(name: 'Sam Robinson', price: 19.0, rating: 4.9),
    Tutor(name: 'Sophia Lee', price: 42.0, rating: 3.9),
    Tutor(name: 'William Taylor', price: 37.0, rating: 4.4),
    // Add more tutors
  ];

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
                itemCount: _tutors.length,
                itemBuilder: (context, index) {
                  Tutor tutor = _tutors[index];
                  return Column(
                    children: [
                      WholeCardSearch(
                        context,
                        tutorName: tutor.name,
                        tutorPrice: tutor.price,
                        tutorRating: tutor.rating,
                      ),
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
                _sortTutors();
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

  void _sortTutors() {
    switch (_selectedSortOption) {
      case 'Best Rated':
        _tutors.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Lowest Price':
        _tutors.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Highest Price':
        _tutors.sort((a, b) => b.price.compareTo(a.price));
        break;
    }
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }
}