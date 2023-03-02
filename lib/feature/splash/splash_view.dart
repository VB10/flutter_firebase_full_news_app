import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/feature/home/home_view.dart';
import 'package:flutter_firebase_full_news_app/feature/splash/splash_provider.dart';
import 'package:flutter_firebase_full_news_app/product/constants/index.dart';
import 'package:flutter_firebase_full_news_app/product/enums/index.dart';
import 'package:flutter_firebase_full_news_app/product/widget/text/wavy_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>
    with _SplashViewListenMixin {
  final splashProvider =
      StateNotifierProvider<SplashProvider, SplashState>((ref) {
    return SplashProvider();
  });

  @override
  void initState() {
    super.initState();
    ref.read(splashProvider.notifier).checkApplicationVersion(''.version);
  }

  @override
  Widget build(BuildContext context) {
    listenAndNavigate(splashProvider);
    return Scaffold(
      backgroundColor: ColorConstants.purplePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconConstants.appIcon.toImage,
            Padding(
              padding: context.onlyTopPaddingLow,
              child: const WavyBoldText(title: StringConstants.appName),
            ),
          ],
        ),
      ),
    );
  }
}

mixin _SplashViewListenMixin on ConsumerState<SplashView> {
  void listenAndNavigate(
    StateNotifierProvider<SplashProvider, SplashState> provider,
  ) {
    ref.listen(provider, (previous, next) {
      if (next.isRequiredForceUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }
      if (next.isRedirectHome != null) {
        if (next.isRedirectHome!) {
          context.navigateToPage(const HomeView());
        } else {
          // false
        }
      }
    });
  }
}
