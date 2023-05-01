import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_web_rtc/src/features/home/viewmodels/homepage_view_model.dart';
import 'package:riverpod_web_rtc/src/providers/router_provider.dart';

import '../repositories/auth_repo.dart';
import 'auth_state_provider.dart';

final homeViewModelProvider = ChangeNotifierProvider((ref) {
  final authState = ref.watch(authStateNotifierProvider);
  final goRouter = ref.watch(goRouterProvider);
  final authRepo = ref.watch(authRepositoryProvider);

  return HomeViewModel(
      authState: authState, goRouter: goRouter, authRepo: authRepo);
});
