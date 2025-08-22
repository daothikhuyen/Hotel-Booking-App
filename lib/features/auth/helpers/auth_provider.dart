import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/model/user.dart';

class UserProvider2 extends ChangeNotifier {
  HBUser? _currentUser;

  HBUser? get currentUser => _currentUser;

  void setUser(HBUser user) {
    _currentUser = user;
    notifyListeners();
  }

  void clearUser() {
    _currentUser = null;
    notifyListeners();
  }
}
