import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

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

  TextEditingController _supplierController = TextEditingController();
  TextEditingController get supplierController => _supplierController;
  set supplierController(TextEditingController newTextEditingController) {
    _supplierController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _nopolController = TextEditingController();
  TextEditingController get nopolController => _nopolController;
  set nopolController(TextEditingController newTextEditingController) {
    _nopolController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _supirController = TextEditingController();
  TextEditingController get supirController => _supirController;
  set supirController(TextEditingController newTextEditingController) {
    _supirController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _barangController = TextEditingController();
  TextEditingController get barangController => _barangController;
  set barangController(TextEditingController newTextEditingController) {
    _barangController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _inputManualController = TextEditingController();
  TextEditingController get inputManualController => _inputManualController;
  set inputManualController(TextEditingController newTextEditingController) {
    _inputManualController = newTextEditingController;
    notifyListeners();
  }

  String _idLaporan =
      "FP-${DateFormat('dd/MM/yy').format(DateTime.now())}/${randomNumeric(4)}";
  String get idLaporan => _idLaporan;
  set idLaporan(String newString) {
    _idLaporan = newString;
    notifyListeners();
  }
}
