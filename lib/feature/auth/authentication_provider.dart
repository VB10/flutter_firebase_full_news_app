import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_full_news_app/product/enums/cache_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier() : super(const AuthenticationState());

  Future<void> fetchUserDetail(User? user) async {
    if (user == null) return;
    final token = await user.getIdToken();
    await tokenSaveToCache(token);
    state = state.copyWith(isRedirect: true);
  }

  Future<void> tokenSaveToCache(String token) async {
    await CacheItems.token.write(token);
  }
}

class AuthenticationState extends Equatable {
  const AuthenticationState({this.isRedirect = false});

  final bool isRedirect;

  @override
  List<Object> get props => [isRedirect];

  AuthenticationState copyWith({
    bool? isRedirect,
  }) {
    return AuthenticationState(
      isRedirect: isRedirect ?? this.isRedirect,
    );
  }
}
