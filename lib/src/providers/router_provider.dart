import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import '../features/authentication/view/login_screen.dart';
import '../features/authentication/view/registration_screen.dart';

// Create a Riverpod provider for the route state
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) =>
            const MaterialPage(child: RegistrationScreen()),
      ),
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
            child: HomePage(
          onLogoutPressed: () {},
        )),
      ),

      // ... other routes
    ],
  );
});
