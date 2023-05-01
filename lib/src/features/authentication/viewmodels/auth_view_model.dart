import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_web_rtc/src/features/authentication/models/auth_state_model.dart';

import '../../../repositories/auth_repo.dart';

class AuthViewModel extends ChangeNotifier {
  final IAuthRepository authRepo;
  final AuthStateNotifier authState;
  final GoRouter goRouter;

  AuthViewModel(
      {required this.goRouter, required this.authRepo, required this.authState})
      : super();

  Future<void> login(String email, String password) async {
    try {
      await authRepo.signIn(email, password);
      authState.setAuthenticationStatus(true);
      log("sign in");
      goRouter.push('/home');

      // Perform any other UI related updates or business logic
    } catch (e) {
      log("error signing in $e");
      // Handle error
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await authRepo.registerUser(email, password);
      authState.setRegistrationStatus(true);
      goRouter.go('/');

      // Perform any other UI related updates or business logic
    } catch (e) {
      log("error regsitering in $e");
      // Handle error
    }
  }

  Future<void> navigateToRegistration() async {
    goRouter.push('/register');
  }
}
