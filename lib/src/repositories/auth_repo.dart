import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/app_config.dart';
import '../providers/app_config_provider.dart';

abstract class IAuthRepository {
  Future<User?> signIn(String email, String pass);
  Future<void> signOut();
  Future<User?> registerUser(String email, String pass);
}

class FirebaseAuthRepo implements IAuthRepository {
  static final FirebaseAuthRepo _instance = FirebaseAuthRepo._internal();
  final FirebaseAuth _firebaseAuth;

  factory FirebaseAuthRepo() {
    return _instance;
  }

  FirebaseAuthRepo._internal() : _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> registerUser(String email, String pass) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass);
      if (kDebugMode) {
        print(userCredential.user.toString());
      }
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> signIn(String email, String pass) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: pass);

      return userCredential.user;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print('Error signing out: $e');
      }
    }
  }
}

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  // Read the app configuration to determine which authentication provider to use
  AppConfig config = ref.watch(appConfigProvider);

  // Return the appropriate authentication repository implementation based on app configuration
  if (config.useFirebaseAuth) {
    return FirebaseAuthRepo();
  } else {
    return FirebaseAuthRepo();
  }
});
