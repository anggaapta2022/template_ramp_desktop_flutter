// ignore_for_file: file_names

import 'package:ramp_desktop/models/timbangan_model.dart';
import 'package:ramp_desktop/services/opendb_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataTimbanganKeluar {
  Future getDataTimbanganKeluar() async {
    Database db = await DBHelper.instance.db;
    var timbanganKeluar = await db.query('laporan');
    List<TimbanganKeluarModel> timbanganKeluarList = timbanganKeluar.isNotEmpty
        ? timbanganKeluar
            .map((item) => TimbanganKeluarModel.fromMap(item))
            .toList()
        : [];
    return timbanganKeluarList;
  }

  Future getDataTimbanganKeluarById(String idLaporanKeluar) async {
    Database db = await DBHelper.instance.db;
    var timbanganKeluarById = await db.query(
      'laporan',
      where: 'idLaporanKeluar = ?',
      whereArgs: [idLaporanKeluar],
    );

    List<TimbanganKeluarModel> timbanganKeluarListById =
        timbanganKeluarById.isNotEmpty
            ? timbanganKeluarById
                .map((item) => TimbanganKeluarModel.fromMap(item))
                .toList()
            : [];
    return timbanganKeluarListById;
  }

  Future addTimbanganKeluar(TimbanganKeluarModel timbanganKeluar) async {
    Database db = await DBHelper.instance.db;
    return await db.insert('laporan', timbanganKeluar.toMap());
  }
}
