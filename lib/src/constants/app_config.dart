import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppConfig {
  bool useFirebaseAuth; // Example property for app configuration

  AppConfig({required this.useFirebaseAuth});
}

final appConfigProvider = StateProvider<AppConfig>((ref) {
  // You can initialize and return the AppConfig object here
  // based on your app's configuration logic, such as reading
  // from a configuration file, making API calls, etc.

  // Example initialization based on a boolean flag
  bool useFirebaseAuth =
      true; // Set to true for Firebase Auth, false for other auth provider
  return AppConfig(useFirebaseAuth: useFirebaseAuth);
});
