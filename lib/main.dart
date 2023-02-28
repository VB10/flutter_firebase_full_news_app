import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/feature/home/home_view.dart';
import 'package:flutter_firebase_full_news_app/product/initialize/application_start.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomeView(),
    );
  }
}
