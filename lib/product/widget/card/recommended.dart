import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/product/enums/index.dart';
import 'package:flutter_firebase_full_news_app/product/models/recomanded.dart';
import 'package:kartal/kartal.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    required this.recommended,
    super.key,
  });

  final Recommended recommended;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingLow,
      child: Row(
        children: [
          Image.network(
            recommended.image ?? '',
            height: ImageSizes.normal.value.toDouble(),
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
          ),
          Expanded(
            child: ListTile(
              title: Text(recommended.title ?? ''),
              subtitle: Text(
                recommended.description ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
