import 'package:flutter/material.dart';

import 'package:flutter_firebase_full_news_app/product/models/tag.dart';

class HomeSearchDelegate extends SearchDelegate<Tag?> {
  HomeSearchDelegate(this.tagItems);

  final List<Tag> tagItems;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = tagItems.where(
      (element) =>
          element.name?.toLowerCase().contains(query.toLowerCase()) ?? false,
    );

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(results.elementAt(index).name ?? ''),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = tagItems.where(
      (element) =>
          element.name?.toLowerCase().contains(query.toLowerCase()) ?? false,
    );

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            onTap: () {
              close(context, results.elementAt(index));
            },
            title: Text(results.elementAt(index).name ?? ''),
          ),
        );
      },
    );
  }
}
