import 'package:ramp_desktop/models/supplier_model.dart';
import 'package:ramp_desktop/services/opendb_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataSupplier {
  Future getDataSupplier() async {
    Database db = await DBHelper.instance.db;
    var supplier = await db.query('supplier');
    List<SupplierModel> supplierList = supplier.isNotEmpty
        ? supplier.map((item) => SupplierModel.fromMap(item)).toList()
        : [];
    return supplierList;
  }

  Future<Map<String, String>> getDataSupplierInputText() async {
    Database db = await DBHelper.instance.db;
    var supplier = await db.query('supplier');
    final dataList = <String, String>{};
    for (final result in supplier) {
      final idSupplier = result['idSupplier'].toString();
      final namaSupplier = result['namaSupplier'].toString();
      dataList[idSupplier] = namaSupplier;
    }
    return dataList;
  }
}
