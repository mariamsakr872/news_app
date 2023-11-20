
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {

  String currentLocale = "en";

  changeLanguage(String newLanguage) {
    if (currentLocale == newLanguage) return;
    currentLocale = newLanguage;

    notifyListeners();
  }




}