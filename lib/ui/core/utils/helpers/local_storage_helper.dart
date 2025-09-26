import 'dart:convert';

import 'package:hotel_booking_app/data/model/user.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static const _keyUser = 'currentUser';

  static Future<void> saveUser(HBUser user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyUser, jsonEncode(user.toJson()));
    } on Exception catch (e) {
      throw AppException(message: e.toString());
    }
  }

  static Future<HBUser?> getUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_keyUser);
      if (data != null) {
        return HBUser.fromJson(jsonDecode(data));
      }
      return null;
    } on Exception catch (e) {
      throw AppException(message: e.toString());
    }
  }

  static Future<void> removeUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_keyUser);
    } on Exception catch (e) {
      throw AppException(message: 'Error removerUser: $e');
    }
  }
}
