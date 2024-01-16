import 'package:flutter/material.dart';
import 'package:login/widgets/Pair/Pair.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<Pair<String, String>> suggestions;

  CustomSearchDelegate(this.suggestions);

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
      List<Pair<String, String>> matchQuery = [];
      for (var sug in suggestions) {
        if (sug.first.toLowerCase().contains(query.toLowerCase())) {
          matchQuery.add(sug);
        }
        else if (sug.second.toLowerCase().contains(query.toLowerCase())) {
          matchQuery.add(sug);
        }
      }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: Icon(Icons.search, size: 25),
          title: Text(result.first),
          subtitle: Text(result.second),
        );
      },
    );
    
    
    /*FutureBuilder<List<String>> (
      future: _fetchSuggestions(query),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the data is being fetched, display a loading indicator
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (snapshot.hasError) {
           // If an error occurs while fetching data, display an error message
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        else if (!snapshot.hasData || (snapshot.data?.isEmpty ?? true)) {
          // If there are no suggestions, display a message indicating so
          return Center(
            child: Text('No suggestions found'),
          );
        }
        else {
          // If data is available, display the suggestions
          final List<String>? suggestions = snapshot.data;
          return ListView.builder(
            itemCount: suggestions!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(suggestions[index]),
                onTap: () {
                  // Handle when a suggestion is tapped
                  // For example, you can close the search and show details
                  close(context, suggestions[index]);
                }
              );
            }
          );
        }
      })
    );
   /* // Implement your search results here
    return Center(
      child: Text(
        'Searching results for: $query',
        style: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0), // Set your desired color here
        ),
      ),
    );*/*/
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Pair<String, String>> matchQuery = [];
      for (var sug in suggestions) {
        if (sug.first.toLowerCase().contains(query.toLowerCase())) {
          matchQuery.add(sug);
        }
        else if (sug.second.toLowerCase().contains(query.toLowerCase())) {
          matchQuery.add(sug);
        }
      }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: Icon(Icons.search, size: 25),
          title: Text(result.first),
          subtitle: Text(result.second),
        );
      },
    );
    
    
    
    /*FutureBuilder<List<String>> (
      future: _fetchSuggestions(query),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the data is being fetched, display a loading indicator
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (snapshot.hasError) {
           // If an error occurs while fetching data, display an error message
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        else if (!snapshot.hasData || (snapshot.data?.isEmpty ?? true)) {
          // If there are no suggestions, display a message indicating so
          return Center(
            child: Text('No suggestions found'),
          );
        }
        else {
          // If data is available, display the suggestions
          final List<String>? suggestions = snapshot.data;
          return ListView.builder(
            itemCount: suggestions!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(suggestions[index]),
                onTap: () {
                  // Handle when a suggestion is tapped
                  // For example, you can close the search and show details
                  close(context, suggestions[index]);
                }
              );
            }
          );
        }
      })
    );
    
   /* Center(
      child: Text(
        'Search tutor for: $query',
        style: TextStyle(
          color:  Color.fromARGB(255, 0, 0, 0), // Set your desired color here
        ),
      ),
    );*/*/
  }
}
