import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/product/constants/color_constants.dart';
import 'package:flutter_firebase_full_news_app/product/constants/string_constants.dart';
import 'package:flutter_firebase_full_news_app/product/enums/index.dart';
import 'package:flutter_firebase_full_news_app/product/widget/text/sub_title_text.dart';
import 'package:flutter_firebase_full_news_app/product/widget/text/title_text.dart';
import 'package:kartal/kartal.dart';

part './sub_view/home_chips.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
          padding: context.paddingNormal,
          children: const [
            _Header(),
            _CustomField(),
            _TagListView(),
            _BrowseHorizontalListView(),
            _RecommendedHeader(),
            _RecommendedListView(),
          ],
        ),
      ),
    );
  }
}

class _CustomField extends StatelessWidget {
  const _CustomField();

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.mic_outlined),
        prefixIcon: Icon(Icons.search_off_outlined),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: ColorConstants.grayLighter,
        hintText: StringConstants.homeSearchHint,
      ),
    );
  }
}

class _TagListView extends StatelessWidget {
  const _TagListView();
// https://firebasestorage.googleapis.com/v0/b/flutter-full-news.appspot.com/o/simpleTrick.png?alt=media&token=badeeec0-0ddd-4b2d-8dc3-fd24acb80d10
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.1),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (index.isOdd) {
            return const _ActiveChip();
          }

          return const _PassiveChip();
        },
      ),
    );
  }
}

class _BrowseHorizontalListView extends StatelessWidget {
  const _BrowseHorizontalListView();

  static const dummyImage =
      'https://firebasestorage.googleapis.com/v0/b/flutter-full-news.appspot.com/o/house.png?alt=media&token=3c00e4b0-a61c-4818-8d41-dde8dd420d09';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.3),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return const _HorizontalCard(dummyImage: dummyImage);
        },
      ),
    );
  }
}

class _HorizontalCard extends StatelessWidget {
  const _HorizontalCard({
    required this.dummyImage,
  });

  final String dummyImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.onlyRightPaddingNormal,
          child: Image.network(
            _BrowseHorizontalListView.dummyImage,
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
                      const SubTitleText(
                        value: 'POLITICS',
                        color: ColorConstants.grayLighter,
                      ),
                      Text(
                        'The latest situation in the presidential election',
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

class _RecommendedHeader extends StatelessWidget {
  const _RecommendedHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: TitleText(value: StringConstants.homeTitle),
          ),
          TextButton(
            onPressed: () {},
            child: const SubTitleText(value: StringConstants.homeSeeAll),
          )
        ],
      ),
    );
  }
}

class _RecommendedListView extends StatelessWidget {
  const _RecommendedListView();
  static const dummyImage =
      'https://firebasestorage.googleapis.com/v0/b/flutter-full-news.appspot.com/o/simpleTrick.png?alt=media&token=badeeec0-0ddd-4b2d-8dc3-fd24acb80d10';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return const _RecommendedCard(dummyImage: dummyImage);
      },
    );
  }
}

class _RecommendedCard extends StatelessWidget {
  const _RecommendedCard({
    required this.dummyImage,
  });

  final String dummyImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingLow,
      child: Row(
        children: [
          Image.network(
            dummyImage,
            height: ImageSizes.normal.value.toDouble(),
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
          ),
          const Expanded(
            child: ListTile(
              title: Text('UI/UX Design'),
              subtitle: Text(
                'A Simple Trick For Creating Color Palettes Quickly',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(
          value: StringConstants.homeBrowse,
        ),
        Padding(
          padding: context.onlyTopPaddingLow,
          child: const SubTitleText(
            value: StringConstants.homeMessage,
          ),
        ),
      ],
    );
  }
}
