import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/authentication/models/auth_state_model.dart';

final authStateProvider = StateProvider<AuthState>(
    (ref) => AuthState(isAuthenticated: false, isRegistered: false));
