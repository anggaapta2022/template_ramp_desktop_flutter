import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBHelper {
  DBHelper._init();
  static final DBHelper instance = DBHelper._init();

  static Database? _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    sqfliteFfiInit();
    String path = io.Directory.current.path;
    String dbPath = join(path, 'db', 'ramp.db');
    var databaseFactory = databaseFactoryFfi;
    var db = await databaseFactory.openDatabase(dbPath);
    _onCreate(db);
    return db;
  }

  Future _onCreate(Database db) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS timbanganMasuk(
      idLaporan TEXT NOT NULL PRIMARY KEY,
      supplier TEXT,
      supir TEXT,
      nopol TEXT,
      namaBarang TEXT,
      bruto INTEGER,
      manualBruto INTEGER,
      jamMasuk TEXT,
      konfirmasiBruto TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS barang(
      idBarang TEXT NOT NULL PRIMARY KEY,
      namaBarang TEXT,
      tipeBarang TEXT,
      satuanBarang TEXT,
      tanggalDibuat TEXT,
      tanggalDiubah TEXT,
      diubahOleh TEXT,
      tanggalSinkron TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS supplier(
      idSupplier TEXT NOT NULL PRIMARY KEY,
      kodeGroup TEXT,
      namaSupplier TEXT,
      alamat TEXT,
      namaSP TEXT,
      telepon TEXT,
      fax TEXT,
      pic TEXT,
      tanggalDibuat TEXT,
      tanggalDiubah TEXT,
      diubahOleh TEXT,
      tanggalSinkron TEXT
    )
  ''');
  }

  Future close() async {
    var dbClient = await instance.db;
    dbClient.close();
  }
}
