import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  int selctedIndex = 0;
  Locale locale = const Locale('en');

  Future<void> setSelectedLanguage(int index, String lang) async {
    selctedIndex = index;
    notifyListeners();
  }

  void setLocale(Locale newlocale) {
    locale = newlocale;
    notifyListeners();
  }
}
