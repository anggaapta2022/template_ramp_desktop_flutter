import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ramp_desktop/models/timbangan_model.dart';
import 'package:random_string/random_string.dart';

class TimbanganMasukProvider with ChangeNotifier {
  List<TimbanganMasukModel> _dataTimbangan = <TimbanganMasukModel>[];
  List<TimbanganMasukModel> get dataTimbangan => _dataTimbangan;
  set dataTimbangan(List<TimbanganMasukModel> newList) {
    _dataTimbangan = newList;
    notifyListeners();
  }

  String _idLaporanMasuk =
      "FP-${DateFormat('dd/MM/yy').format(DateTime.now())}/${randomNumeric(4)}";
  String get idLaporanMasuk => _idLaporanMasuk;
  set idLaporanMasuk(String newString) {
    _idLaporanMasuk = newString;
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
}
