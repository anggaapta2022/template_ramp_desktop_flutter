import 'package:flutter/material.dart';
import 'package:ramp_desktop/models/timbangan_model.dart';

class TimbanganMasukProvider with ChangeNotifier {
  List<TimbanganMasukModel> _dataTimbangan = <TimbanganMasukModel>[];
  List<TimbanganMasukModel> get dataTimbangan => _dataTimbangan;
  set dataTimbangan(List<TimbanganMasukModel> newList) {
    _dataTimbangan = newList;
    notifyListeners();
  }
}
