import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/feature/auth/authentication_provider.dart';
import 'package:flutter_firebase_full_news_app/product/constants/index.dart';
import 'package:flutter_firebase_full_news_app/product/widget/text/sub_title_text.dart';
import 'package:flutter_firebase_full_news_app/product/widget/text/title_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  final authProvider =
      StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });

  @override
  void initState() {
    super.initState();
    checkUser(FirebaseAuth.instance.currentUser);
  }

  void checkUser(User? user) {
    ref.read(authProvider.notifier).fetchUserDetail(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firebase.FirebaseUIActions(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (state.user != null) checkUser(state.user);
          }),
        ],
        child: SafeArea(
          child: Padding(
            padding: context.paddingLow,
            child: Center(
              child: Row(
                children: [
                  const _LeftPlaceHolder(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const _Header(),
                        const _FirebaseAuth(),
                        if (!ref.watch(authProvider).isRedirect)
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              StringConstants.continueToApp,
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodySmall?.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FirebaseAuth extends StatelessWidget {
  const _FirebaseAuth();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: firebase.LoginView(
        action: AuthAction.signIn,
        showTitle: false,
        providers: firebase.FirebaseUIAuth.providersFor(
          FirebaseAuth.instance.app,
        ),
      ),
    );
  }
}

class _LeftPlaceHolder extends StatelessWidget {
  const _LeftPlaceHolder();

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: getValueForScreenType<Widget>(
        context: context,
        mobile: const SizedBox(),
        tablet: Placeholder(
          fallbackHeight: context.dynamicHeight(0.3),
          fallbackWidth: context.dynamicWidth(0.3),
        ),
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
          value: StringConstants.loginWelcomeBack,
        ),
        Padding(
          padding: context.onlyTopPaddingLow,
          child: const SubTitleText(
            value: StringConstants.loginWelcomeDetail,
          ),
        ),
      ],
    );
  }
}
