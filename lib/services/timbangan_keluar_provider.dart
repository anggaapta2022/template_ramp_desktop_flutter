import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ramp_desktop/models/timbangan_model.dart';
import 'package:random_string/random_string.dart';

class TimbanganKeluarProvider with ChangeNotifier {
  List<TimbanganKeluarModel> _dataTimbangan = <TimbanganKeluarModel>[];
  List<TimbanganKeluarModel> get dataTimbangan => _dataTimbangan;
  set dataTimbangan(List<TimbanganKeluarModel> newList) {
    _dataTimbangan = newList;
    notifyListeners();
  }

  String _idLaporanKeluar =
      "FP-${DateFormat('dd/MM/yy').format(DateTime.now())}/${randomNumeric(4)}";
  String get idLaporanKeluar => _idLaporanKeluar;
  set idLaporanKeluar(String newString) {
    _idLaporanKeluar = newString;
    notifyListeners();
  }

  TextEditingController _inputManualController = TextEditingController();
  TextEditingController get inputManualController => _inputManualController;
  set inputManualController(TextEditingController newTextEditingController) {
    _inputManualController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _potonganPercentController = TextEditingController();
  TextEditingController get potonganPercentController =>
      _potonganPercentController;
  set potonganPercentController(
      TextEditingController newTextEditingController) {
    _potonganPercentController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _beratTandanController = TextEditingController();
  TextEditingController get beratTandanController => _beratTandanController;
  set beratTandanController(TextEditingController newTextEditingController) {
    _beratTandanController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _jumlahTandanController = TextEditingController();
  TextEditingController get jumlahTandanController => _jumlahTandanController;
  set jumlahTandanController(TextEditingController newTextEditingController) {
    _jumlahTandanController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _airController = TextEditingController();
  TextEditingController get airController => _airController;
  set airController(TextEditingController newTextEditingController) {
    _airController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _sampahController = TextEditingController();
  TextEditingController get sampahController => _sampahController;
  set sampahController(TextEditingController newTextEditingController) {
    _sampahController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _tangkaiController = TextEditingController();
  TextEditingController get tangkaiController => _tangkaiController;
  set tangkaiController(TextEditingController newTextEditingController) {
    _tangkaiController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _pasirController = TextEditingController();
  TextEditingController get pasirController => _pasirController;
  set pasirController(TextEditingController newTextEditingController) {
    _pasirController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _mutuController = TextEditingController();
  TextEditingController get mutuController => _mutuController;
  set mutuController(TextEditingController newTextEditingController) {
    _mutuController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _mengkalController = TextEditingController();
  TextEditingController get mengkalController => _mengkalController;
  set mengkalController(TextEditingController newTextEditingController) {
    _mengkalController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _potonganLainController = TextEditingController();
  TextEditingController get potonganLainController => _potonganLainController;
  set potonganLainController(TextEditingController newTextEditingController) {
    _potonganLainController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _mentahController = TextEditingController();
  TextEditingController get mentahController => _mentahController;
  set mentahController(TextEditingController newTextEditingController) {
    _mentahController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _busukController = TextEditingController();
  TextEditingController get busukController => _busukController;
  set busukController(TextEditingController newTextEditingController) {
    _busukController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _kosongController = TextEditingController();
  TextEditingController get kosongController => _kosongController;
  set kosongController(TextEditingController newTextEditingController) {
    _kosongController = newTextEditingController;
    notifyListeners();
  }

  TextEditingController _pulanganLainController = TextEditingController();
  TextEditingController get pulanganLainController => _pulanganLainController;
  set pulanganLainController(TextEditingController newTextEditingController) {
    _pulanganLainController = newTextEditingController;
    notifyListeners();
  }
}
