import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_web_rtc/src/features/authentication/models/auth_state_model.dart';

import '../../../repositories/auth_repo.dart';

class HomeViewModel extends ChangeNotifier {
  final AuthState authState;
  final IAuthRepository authRepo;
  final GoRouter goRouter;

  HomeViewModel(
      {required this.authRepo, required this.goRouter, required this.authState})
      : super();

  logoutButton() {
    if (authState.isAuthenticated) {
      logout();
    }
    print("outside");
  }

  Future<void> logout() async {
    try {
      await authRepo.signOut();
      // Perform any other UI related updates or business logic
      print("Succesfully logged out");
      goRouter.go('/');
    } catch (e) {
      // Handle error
    }
  }
}
