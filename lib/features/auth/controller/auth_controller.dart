import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/widgets/alter/diaglog.dart';
import 'package:hotel_booking_app/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/data/model/user.dart';
import 'package:hotel_booking_app/features/auth/services/auth_service.dart';
import 'package:hotel_booking_app/features/home/main_home_screen.dart';
import 'package:hotel_booking_app/routes/app_router.dart';

class AuthController {
  final HBSnackBar snackBar = HBSnackBar();
  final HBDiaglog diaglog = HBDiaglog();
  final AuthService authService = AuthService();

  Future<HBUser?> getCurrentUser(BuildContext context) async {
    try {
      return await authService.getCurrentUser(context);
    } on AppException catch (e) {
      debugPrint('getCurrentUser: $e');
    }
    return null;
  }

  // sign in with email and password
  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
    required GlobalKey<FormState> formKey,
  }) async {
    if (formKey.currentState!.validate()) {
      try {
        diaglog.showLoading(context);
        await AuthService().signInUser(context, email, password);
        await Navigator.push(context, animationRouter(const MainHomeScreen()));
      } on AppException catch (e) {
        snackBar.showSnackBar(context, e.message);
      } finally {
        Navigator.pop(context);
      }
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      diaglog.showLoading(context);
      await AuthService().signInUserWithGoogle(context);
      await Navigator.push(context, animationRouter(const MainHomeScreen()));
    } on AppException catch (e) {
      snackBar.showSnackBar(context, e.message);
    } finally {
      Navigator.pop(context);
    }
  }
}
