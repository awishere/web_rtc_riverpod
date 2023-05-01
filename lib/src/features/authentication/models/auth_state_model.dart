import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isAuthenticated;
  final bool isRegistered;

  AuthState({
    required this.isAuthenticated,
    required this.isRegistered,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isRegistered,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isRegistered: isRegistered ?? this.isRegistered,
    );
  }
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(AuthState state) : super(state);

  void setAuthenticationStatus(bool isAuthenticated) {
    state = state.copyWith(isAuthenticated: isAuthenticated);
  }

  void setRegistrationStatus(bool isRegistered) {
    state = state.copyWith(isRegistered: isRegistered);
  }
}
