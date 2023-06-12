import 'package:ramp_desktop/services/opendb_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataSupir {
  Future<Map<String, String>> getDataSupirInputText() async {
    Database db = await DBHelper.instance.db;
    var supplier = await db.query('supir');
    final dataList = <String, String>{};
    for (final result in supplier) {
      final idSupir = result['idSupir'].toString();
      final supirName = result['supirName'].toString();
      dataList[idSupir] = supirName;
    }
    return dataList;
  }
}
