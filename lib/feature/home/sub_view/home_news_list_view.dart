import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/product/models/news.dart';
import 'package:flutter_firebase_full_news_app/product/utility/exception/custom_exception.dart';
import 'package:flutter_firebase_full_news_app/product/utility/firebase/firebase_collections.dart';
import 'package:kartal/kartal.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    final news = FirebaseCollections.news.reference;

    final response = news.withConverter(
      fromFirestore: (snapshot, options) {
        return const News().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseCustomException('$value not null');
        return value.toJson();
      },
    ).get();
    return FutureBuilder(
      future: response,
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot<News?>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Placeholder();
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const LinearProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasData) {
              final values = snapshot.data!.docs.map((e) => e.data()).toList();
              return ListView.builder(
                itemCount: values.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          values[index]?.backgroundImage ?? '',
                          height: context.dynamicHeight(.1),
                        ),
                        Text(
                          values[index]?.title ?? '',
                          style: context.textTheme.labelLarge,
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
        }
      },
    );
  }
}
