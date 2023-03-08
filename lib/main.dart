import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/feature/auth/authentication_view.dart';
import 'package:flutter_firebase_full_news_app/feature/home/home_view.dart';
import 'package:flutter_firebase_full_news_app/product/constants/index.dart';
import 'package:flutter_firebase_full_news_app/product/initialize/app_builder.dart';
import 'package:flutter_firebase_full_news_app/product/initialize/app_theme.dart';
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
    return MaterialApp(
      builder: (context, child) => AppBuilder(child).build(),
      title: StringConstants.appName,
      home: const HomeView(),
      theme: AppTheme(context).theme,
    );
  }
}
