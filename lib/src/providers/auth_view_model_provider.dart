import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_web_rtc/src/providers/router_provider.dart';

import '../features/authentication/viewmodels/auth_view_model.dart';
import '../repositories/auth_repo.dart';
import 'auth_state_provider.dart';

final authViewModelProvider = ChangeNotifierProvider((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  final authState = ref.watch(authStateNotifierProvider.notifier);
  final goRouter = ref.watch(goRouterProvider);

  return AuthViewModel(
      authRepo: authRepo, authState: authState, goRouter: goRouter);
});
