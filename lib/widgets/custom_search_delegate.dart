import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: const Color.fromARGB(255, 0, 0, 0), // Set your desired color here
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: const Color.fromARGB(255, 0, 0, 0), // Set your desired color here
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results here
    return Center(
      child: Text(
        'Searching results for: $query',
        style: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0), // Set your desired color here
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement your search suggestions here
    return Center(
      child: Text(
        'Search tutor for: $query',
        style: TextStyle(
          color:  Color.fromARGB(255, 0, 0, 0), // Set your desired color here
        ),
      ),
    );
  }
}
