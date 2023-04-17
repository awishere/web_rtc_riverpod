import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_web_rtc/main.dart';
import 'package:riverpod_web_rtc/src/features/authentication/models/auth_state_model.dart';

import '../../../repositories/auth_repo.dart';

class AuthViewModel extends ChangeNotifier {
  final IAuthRepository authRepo;
  final AuthState authState;
  final GoRouter goRouter;

  AuthViewModel(
      {required this.goRouter, required this.authRepo, required this.authState})
      : super();

  Future<void> login(String email, String password) async {
    try {
      await authRepo.signIn(email, password);
      authState.isAuthenticated = true;
      log("sign in");
      log(authState.isAuthenticated.toString());
      handleAuthStateChanges();

      // Perform any other UI related updates or business logic
    } catch (e) {
      log("error signing in $e");
      // Handle error
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await authRepo.registerUser(email, password);
      authState.isRegistered = true;
      handleAuthStateChanges();
      // Perform any other UI related updates or business logic
    } catch (e) {
      log("error regsitering in $e");
      // Handle error
    }
  }

  Future<void> logout(context) async {
    try {
      await authRepo.signOut();
      handleAuthStateChanges();
      // Perform any other UI related updates or business logic
    } catch (e) {
      // Handle error
    }
  }

  Future<void> navigateToRegistration() async {
    goRouter.push('/register');
  }

  Future<void> handleAuthStateChanges() async {
    try {
      // Access the auth state from authStateProvider
      final isAuthenticated = authState.isAuthenticated;
      final isRegistered = authState.isRegistered;
      if (isRegistered) {
        log("registered");
        goRouter.push('/login');
      }
      if (isAuthenticated) {
        log("authenticated");
        goRouter.push('/');
        // Handle authenticated state
        // e.g., navigate to home screen
        // ...
      } else {
        // Handle unauthenticated state
        // e.g., navigate to login screen
        // ...
      }
    } catch (e) {
      // Handle error
    }
  }
}
