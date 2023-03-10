import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/product/constants/color_constants.dart';
import 'package:flutter_firebase_full_news_app/product/enums/index.dart';
import 'package:flutter_firebase_full_news_app/product/models/news.dart';
import 'package:flutter_firebase_full_news_app/product/widget/text/sub_title_text.dart';
import 'package:kartal/kartal.dart';

class HomeNewsCard extends StatelessWidget {
  const HomeNewsCard({
    required this.newsItem,
    super.key,
  });

  final News? newsItem;

  @override
  Widget build(BuildContext context) {
    if (newsItem == null) return const SizedBox.shrink();
    return Stack(
      children: [
        Padding(
          padding: context.onlyRightPaddingNormal,
          child: Image.network(
            newsItem!.backgroundImage ?? '',
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: ColorConstants.white,
                    size: WidgetSize.iconNormal.value.toDouble(),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: context.paddingLow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubTitleText(
                        value: newsItem!.category ?? '',
                        color: ColorConstants.grayLighter,
                      ),
                      Text(
                        newsItem!.title ?? '',
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: ColorConstants.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
