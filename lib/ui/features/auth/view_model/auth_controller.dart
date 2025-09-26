import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/user.dart';
import 'package:hotel_booking_app/data/repositories/api_response.dart';
import 'package:hotel_booking_app/data/repositories/api_status.dart';
import 'package:hotel_booking_app/data/services/auth_service.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/utils/helpers/local_storage_helper.dart';

class AuthController extends ChangeNotifier {
  final AuthService authService = AuthService();
  HBUser? _currentUser;

  HBUser? get currentUser => _currentUser;
  bool _isSignIn = false;
  bool get isSignIn => _isSignIn;

  void setUser(HBUser user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<void> clearUser() async {
    _currentUser = null;
    _isSignIn = false;
    await LocalStorageHelper.removeUser();
    notifyListeners();
  }

  Future<void> isLoggedIn() async {
    final user = await LocalStorageHelper.getUserData();
    _isSignIn = user != null;
    notifyListeners();
  }

  // sign in with email and password
  Future<ApiResponse> signIn({
    required BuildContext context,
    required String email,
    required String password,
    required GlobalKey<FormState> formKey,
  }) async {
    try {
      if (formKey.currentState!.validate()) {
        final user = await AuthService().signInUser(context, email, password);
        return ApiResponse(
          ApiStatus.success,
          message: context.l10n.signInSucess,
          data: user,
        );
      }
      return ApiResponse(ApiStatus.error);
    } on AppException catch (e) {
      return ApiResponse(ApiStatus.error, message: e.message);
    }
  }

  Future<ApiResponse> signInWithGoogle(BuildContext context) async {
    try {
      final user = await AuthService().signInUserWithGoogle(context);
      return ApiResponse(
        ApiStatus.success,
        message: context.l10n.signInSucess,
        data: user,
      );
    } on AppException catch (e) {
      return ApiResponse(ApiStatus.error, message: e.message);
    }
  }

  Future<ApiResponse> updateProfile({
    required BuildContext context,
    required String displayName,
    required String phone,
    required String location,
    required GlobalKey<FormState> formKey,
  }) async {
    if (formKey.currentState!.validate()) {
      try {
        final user = await AuthService().updateProfile(
          context,
          displayName,
          phone,
          location,
        );
        return ApiResponse(
          ApiStatus.success,
          message: context.l10n.updateSucess,
          data: user,
        );
      } on AppException catch (e) {
        return ApiResponse(ApiStatus.error, message: e.message);
      }
    }
    return ApiResponse(ApiStatus.error);
  }

  Future<ApiResponse> signOut(BuildContext context) async {
    try {
      await clearUser();
      await authService.signOut(context);
      notifyListeners();
      return ApiResponse(ApiStatus.success);
    } on AppException catch (e) {
      return ApiResponse(ApiStatus.error, message: e.message);
    }
  }
}
