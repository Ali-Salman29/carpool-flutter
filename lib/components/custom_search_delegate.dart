import 'package:carpool/services/ride_api_service.dart';
import 'package:flutter/material.dart';
import '../models/ride.dart';

class CustomSearchDelegate extends SearchDelegate<City> {
  final List<City> searchTerms;

  CustomSearchDelegate({required this.searchTerms});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, City(name: ''));
      },
      icon: const Icon(Icons.arrow_back_ios_sharp),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return Theme.of(context).copyWith(
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
      )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<City> matchQuery = [];
    for (var city in searchTerms) {
      if (city.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.name),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<City> matchQuery = [];
    for (var city in searchTerms) {
      if (city.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.name),
          onTap: (){
              Navigator.of(context).pop(result);
          },
        );
      },
    );
  }
}
