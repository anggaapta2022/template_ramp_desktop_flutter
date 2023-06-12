import 'package:flutter/material.dart';

class GlobalProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool newBool) {
    _loading = newBool;
    notifyListeners();
  }

  String _dataTab = "";
  String get dataTab => _dataTab;
  set dataTab(String newString) {
    _dataTab = newString;
    notifyListeners();
  }
}
