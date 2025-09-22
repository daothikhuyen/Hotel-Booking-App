import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  int selctedIndex = 0;

  Future<void> setSelectedLanguage(int index, String lang) async{
    selctedIndex = index;
    notifyListeners();
  }
}
