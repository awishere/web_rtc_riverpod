import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/view/login_screen.dart';
import '../features/authentication/view/registration_screen.dart';
import '../features/home/view/homepage.dart';

// Create a Riverpod provider for the route state
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          pageBuilder: (context, state) =>
              const MaterialPage(child: LoginPage()),
          routes: [
            GoRoute(
              path: 'register',
              pageBuilder: (context, state) =>
                  const MaterialPage(child: RegistrationScreen()),
            ),
            GoRoute(
              path: 'home',
              pageBuilder: (context, state) => MaterialPage(child: HomePage()),
            ),
          ]),

      // ... other routes
    ],
  );
});
