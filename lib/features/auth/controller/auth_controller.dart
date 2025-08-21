import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/core/routes/page_routes.dart';
import 'package:hotel_booking_app/core/widgets/alter/diaglog.dart';
import 'package:hotel_booking_app/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/data/model/user.dart';
import 'package:hotel_booking_app/features/auth/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  final HBSnackBar snackBar = HBSnackBar();
  final HBDiaglog diaglog = HBDiaglog();
  final AuthService authService = AuthService();

  HBUser? _currentUser;

  HBUser? get currentUser => _currentUser;
  bool _isSignIn = false;
  bool get isSignIn => _isSignIn;

  void setUser(HBUser user) {
    _currentUser = user;
    notifyListeners();
  }

  void clearUser() {
    _currentUser = null;
    notifyListeners();
  }

  Future<void> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    _isSignIn =  prefs.getBool('isSignIn') ?? false;
    notifyListeners();
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
        await context.push(PageRoutes.homePage);
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
      await context.push(PageRoutes.homePage);
    } on AppException catch (e) {
      snackBar.showSnackBar(context, e.message);
    } finally {
      Navigator.pop(context);
    }
  }
}
