// ignore_for_file: file_names

import 'package:ramp_desktop/models/timbangan_model.dart';
import 'package:ramp_desktop/services/opendb_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataTimbanganMasuk {
  Future getDataTimbanganMasuk() async {
    Database db = await DBHelper.instance.db;
    var timbanganMasuk = await db.query('timbanganMasuk');
    List<TimbanganMasukModel> timbanganMasukList = timbanganMasuk.isNotEmpty
        ? timbanganMasuk
            .map((item) => TimbanganMasukModel.fromMap(item))
            .toList()
        : [];
    return timbanganMasukList;
  }

  Future getDataTimbanganMasukById(String idLaporan) async {
    Database db = await DBHelper.instance.db;
    var timbanganMasukById = await db.query(
      'timbanganMasuk',
      where: 'idLaporan = ?',
      whereArgs: [idLaporan],
    );

    List<TimbanganMasukModel> timbanganMasukListById =
        timbanganMasukById.isNotEmpty
            ? timbanganMasukById
                .map((item) => TimbanganMasukModel.fromMap(item))
                .toList()
            : [];
    return timbanganMasukListById;
  }

  Future addTimbanganMasuk(TimbanganMasukModel timbanganMasuk) async {
    Database db = await DBHelper.instance.db;
    return await db.insert('timbanganMasuk', timbanganMasuk.toMap());
  }
}
