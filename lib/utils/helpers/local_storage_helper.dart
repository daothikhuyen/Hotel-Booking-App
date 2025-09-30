import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hotel_booking_app/data/model/user.dart';
import 'package:hotel_booking_app/ui/core/exceptions/app_exception.dart';
import 'package:hotel_booking_app/ui/core/exceptions/error_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static const _keyUser = 'currentUser';

  static Future<void> saveUser(HBUser user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyUser, jsonEncode(user.toJson()));
    } on MissingPluginException {
      throw AppException(
        type: ErrorType.unknown,
        message: 'SharedPreferences not available',
      );
    } on PlatformException catch (e) {
      throw AppException(type: ErrorType.unknown, message: '${e.message}');
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
    } on FormatException catch (e) {
      throw AppException(type: ErrorType.unknown, message: '$e');
    }
  }

  static Future<void> removeUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_keyUser);
    } on MissingPluginException {
      throw AppException(
        type: ErrorType.unknown,
        message: 'SharedPreferences not available',
      );
    } on PlatformException catch (e) {
      throw AppException(type: ErrorType.unknown, message: '${e.message}');
    }
  }
}
