import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginProvider extends StateNotifier<int> {
  LoginProvider() : super(0);

  void increment() {
    state++;
  }
}
