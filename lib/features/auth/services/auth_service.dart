import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;

  Stream<User?> get authStateChanges => auth.authStateChanges();

  // Get current user
  Future<User?> getCurrentUser() async {
    return auth.currentUser;
  }

  Future<String> signInUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return 'sucess';
    } on FirebaseAuthException catch (e) {
      return 'Login failed';
    }
  }

  Future<String> signInUserWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      await auth.signInWithCredential(credential);

      return 'sucess';
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return 'Google Login Failed';
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
