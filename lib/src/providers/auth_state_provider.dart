import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/authentication/models/auth_state_model.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(
      AuthState(isAuthenticated: false, isRegistered: false));
});
