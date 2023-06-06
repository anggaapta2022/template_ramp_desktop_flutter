import 'package:ramp_desktop/models/barang_model.dart';
import 'package:ramp_desktop/services/opendb_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBarang {
  Future getDataBarang() async {
    Database db = await DBHelper.instance.db;
    var barang = await db.query('barang');
    List<BarangModel> barangList = barang.isNotEmpty
        ? barang.map((item) => BarangModel.fromMap(item)).toList()
        : [];
    return barangList;
  }
}
