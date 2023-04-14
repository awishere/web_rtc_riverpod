import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/auth_repo.dart';

class AuthViewModel extends ChangeNotifier {
  final IAuthRepository authRepo;

  AuthViewModel({required this.authRepo}) : super();

  Future<void> login(String email, String password) async {
    try {
      await authRepo.signIn(email, password);

      // Perform any other UI related updates or business logic
    } catch (e) {
      // Handle error
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await authRepo.registerUser(email, password);
      print("registered");
      // Perform any other UI related updates or business logic
    } catch (e) {
      // Handle error
    }
  }

  Future<void> logout(context) async {
    try {
      await authRepo.signOut();

      // Perform any other UI related updates or business logic
    } catch (e) {
      // Handle error
    }
  }
}

final authViewModelProvider = ChangeNotifierProvider((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return AuthViewModel(authRepo: authRepo);
});
