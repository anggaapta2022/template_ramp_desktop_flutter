import 'package:ramp_desktop/services/opendb_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataKendaraan {
  Future<Map<String, String>> getDataKendaraanInputText() async {
    Database db = await DBHelper.instance.db;
    var supplier = await db.query('kendaraan');
    final dataList = <String, String>{};
    for (final result in supplier) {
      final idKendaraan = result['idKendaraan'].toString();
      final noPolisi = result['noPolisi'].toString();
      dataList[idKendaraan] = noPolisi;
    }
    return dataList;
  }
}
