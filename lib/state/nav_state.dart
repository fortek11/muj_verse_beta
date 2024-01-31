import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderNav with ChangeNotifier {
  int pageIndex = 2;
  String appbar = 'HomeScreen';
  void changePageTo(int selectedPage, String appbarContent) {
    pageIndex = selectedPage;
    appbar = appbarContent;
    notifyListeners();
  }
}
