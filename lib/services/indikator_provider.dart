import 'package:flutter/material.dart';

class IndikatorProvider extends ChangeNotifier {
  String _devicePort = "";
  String get devicePort => _devicePort;
  set devicePort(String newString) {
    _devicePort = newString;
    notifyListeners();
  }

  String _baudRate = "";
  String get baudRate => _baudRate;
  set baudRate(String newString) {
    _baudRate = newString;
    notifyListeners();
  }

  String _parity = "";
  String get parity => _parity;
  set parity(String newString) {
    _parity = newString;
    notifyListeners();
  }

  String _dataBits = "";
  String get dataBits => _dataBits;
  set dataBits(String newString) {
    _dataBits = newString;
    notifyListeners();
  }

  String _stopBits = "";
  String get stopBits => _stopBits;
  set stopBits(String newString) {
    _stopBits = newString;
    notifyListeners();
  }
}
