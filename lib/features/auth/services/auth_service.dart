import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/firestore_collections.dart';
import 'package:hotel_booking_app/features/auth/helpers/local_storage_helper.dart';
import 'package:hotel_booking_app/features/auth/helpers/auth_provider.dart';
import 'package:hotel_booking_app/data/model/user.dart';
import 'package:provider/provider.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  HBUser? hbUser;
  User? get currentUser => auth.currentUser;

  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future<void> signUpUser({
    required BuildContext context,
    required String id,
    required String email,
    required String location,
  }) async {
    try {
      final userDoc =
          await _firestore
              .collection(FirestoreCollections.users)
              .doc(currentUser?.uid)
              .get();

      if (!userDoc.exists) {
        final hbUser = HBUser(
          uid: id,
          email: email,
          displayName: email.split('@')[0],
          location: location,
        );
        debugPrint('Creating User: ${hbUser.toJson()}');
        return await _firestore
            .collection('users')
            .doc(currentUser?.uid)
            .set(hbUser.toJson());
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('Error SignUp :${e.message}');
      throw AppException(message: context.l10n.signUpFailed);
    }
  }

  Future<void> signInUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      final credentail = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final snapshot =
          await _firestore
              .collection(FirestoreCollections.users)
              .doc(credentail.user?.uid)
              .get();

      if (snapshot.exists && snapshot.data() != null) {
        final user = HBUser.fromJson(
          snapshot.data() ?? {},
          credentail.user?.uid ?? '0',
        );

        await LocalStorageHelper.saveUser(user);
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        return;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('Error SignIn :${e.message}');
      throw AppException(message: context.l10n.signInFailed);
    }
  }

  Future<void> signInUserWithGoogle(BuildContext context) async {
    try {
      final gUser = await GoogleSignIn().signIn();

      final gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      await auth.signInWithCredential(credential);

      return;
    } on FirebaseAuthException catch (e) {
      debugPrint('Error Google:${e.message}');
      throw AppException(message: context.l10n.signInFailed);
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
