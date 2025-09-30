import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_booking_app/data/model/user.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/ui/core/exceptions/error_type.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/firestore_collections.dart';
import 'package:hotel_booking_app/ui/core/network/network_util.dart';
import 'package:hotel_booking_app/utils/helpers/local_storage_helper.dart';

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
    await NetworkUtil.hasNetwork(context);
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
        return await _firestore
            .collection('users')
            .doc(currentUser?.uid)
            .set(hbUser.toJson());
      }
    } on FirebaseAuthException {
      throw AppException(
        type: ErrorType.unknown,
        message: context.l10n.signUpFailed,
      );
    } 
  }

  Future signInUser(BuildContext context, String email, String password) async {
    await NetworkUtil.hasNetwork(context);
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

      if (!snapshot.exists && snapshot.data() == null) {
        throw AppException(
          type: ErrorType.notFound,
          message: context.l10n.signUpFailed,
        );
      }

      final user = HBUser.fromJson(snapshot.data() ?? {});

      await LocalStorageHelper.saveUser(user);
      return user;
    } on FirebaseAuthException{
      throw AppException(
        type: ErrorType.invalidCredential,
        message: context.l10n.signUpFailed,
      );
    }
  }

  Future signInUserWithGoogle(BuildContext context) async {
    await NetworkUtil.hasNetwork(context);
    try {
      final gUser = await GoogleSignIn().signIn();

      final gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final snapshot = await auth.signInWithCredential(credential);

      if (snapshot.user != null) {
        final docSnapshot =
            await FirebaseFirestore.instance
                .collection(FirestoreCollections.users)
                .doc(snapshot.user!.uid)
                .get();
        if (docSnapshot.exists) {
          final user = HBUser.fromJson(docSnapshot.data() ?? {});
          await LocalStorageHelper.saveUser(user);
          return user;
        } else {
          await signUpUser(
            context: context,
            id: snapshot.user?.uid ?? '',
            email: snapshot.user?.email ?? '',
            location: 'San Francico',
          );
        }
      }

      return;
    } on FirebaseAuthException {
      throw AppException(
        type: ErrorType.invalidCredential,
        message: context.l10n.signUpFailed,
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    await NetworkUtil.hasNetwork(context);
    try {
      await auth.signOut();
    } on FirebaseException {
      throw AppException(
        type: ErrorType.unknown,
        message: context.l10n.signOutFailed,
      );
    }
  }

  Future updateProfile(
    BuildContext context,
    String displayName,
    String phone,
    String location,
  ) async {
    await NetworkUtil.hasNetwork(context);
    try {
      final docRef = _firestore
          .collection(FirestoreCollections.users)
          .doc(currentUser?.uid ?? '');

      final hbUser = HBUser(
        uid: currentUser?.uid ?? '',
        email: currentUser?.email ?? '',
        displayName: displayName,
        numberPhone: phone,
        location: location,
        photoURL: currentUser?.photoURL,
      );

      await docRef.update(hbUser.toJson());
      await currentUser?.updateDisplayName(displayName);

      await LocalStorageHelper.saveUser(hbUser);
      return hbUser;
    } on FirebaseException {
      throw AppException(
        type: ErrorType.invalidCredential,
        message: context.l10n.updateFailed,
      );
    }
  }
}
