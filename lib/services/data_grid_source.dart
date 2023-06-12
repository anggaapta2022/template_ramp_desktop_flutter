// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramp_desktop/models/barang_model.dart';
import 'package:ramp_desktop/models/timbangan_model.dart';
import 'package:ramp_desktop/services/global_provider.dart';
import 'package:ramp_desktop/shared/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/supplier_model.dart';

class TimbanganMasukDataSource extends DataGridSource {
  BuildContext? buildContext;
  List<DataGridRow> _timbanganMasuk = [];
  @override
  List<DataGridRow> get rows => _timbanganMasuk;

  TimbanganMasukDataSource(
      {required List<TimbanganMasukModel> timbanganMasuk,
      required this.buildContext}) {
    _timbanganMasuk = timbanganMasuk.map<DataGridRow>((e) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'action', value: e.idLaporan),
        DataGridCell<String>(columnName: 'idLaporan', value: e.idLaporan),
        DataGridCell<String>(columnName: 'supplier', value: e.supplier),
        DataGridCell<String>(columnName: 'supir', value: e.supir),
        DataGridCell<String>(columnName: 'nopol', value: e.nopol),
        DataGridCell<String>(columnName: 'barang', value: e.namaBarang),
        DataGridCell<int>(columnName: 'bruto', value: e.bruto),
        DataGridCell<int>(columnName: 'manualBruto', value: e.manualBruto),
        DataGridCell<String>(columnName: 'jamMasuk', value: e.jamMasuk),
        DataGridCell<String>(
            columnName: 'konfirmasiBruto', value: e.konfrimasiBruto),
      ]);
    }).toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    var globalProvider =
        Provider.of<GlobalProvider>(buildContext!, listen: false);
    return DataGridRowAdapter(
        cells: row.getCells().map((e) {
      return e.columnName == "action"
          ? MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    print("isi value aselole jos: ${e.value}");
                    globalProvider.dataTab = e.value;
                    DefaultTabController.of(buildContext!).animateTo(1);
                  },
                  child: Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                      color: cBlue.withOpacity(0.78),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Timbang Keluar",
                        style: whiteTextStyle.copyWith(
                            fontSize: 12, fontWeight: semiBold),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                e.value.toString(),
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
            );
    }).toList());
  }
}

class BarangDataSource extends DataGridSource {
  List<DataGridRow> _barang = [];
  @override
  List<DataGridRow> get rows => _barang;

  BarangDataSource({required List<BarangModel> barang}) {
    _barang = barang
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'idBarang', value: e.idBarang),
              DataGridCell<String>(
                  columnName: 'namaBarang', value: e.namaBarang),
              DataGridCell<String>(
                  columnName: 'tipeBarang', value: e.tipeBarang),
              DataGridCell<String>(
                  columnName: 'satuanBarang', value: e.satuanBarang),
              DataGridCell<String>(
                  columnName: 'tanggalDibuat', value: e.tanggalDibuat),
              DataGridCell<String>(
                  columnName: 'tanggalDiubah', value: e.tanggalDiubah),
              DataGridCell<String>(
                  columnName: 'diubahOleh', value: e.diubahOleh),
              DataGridCell<String>(
                  columnName: 'tanggalSinkron', value: e.tanggalSinkron),
            ]))
        .toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((e) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, top: 5),
        child: Text(
          e.value.toString(),
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
        ),
      );
    }).toList());
  }
}

class SupplierDataSource extends DataGridSource {
  List<DataGridRow> _supplier = [];
  @override
  List<DataGridRow> get rows => _supplier;

  SupplierDataSource({required List<SupplierModel> supplier}) {
    _supplier = supplier
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'idSupplier', value: e.idSupplier),
              DataGridCell<String>(columnName: 'kodeGroup', value: e.kodeGroup),
              DataGridCell<String>(
                  columnName: 'namaSupplier', value: e.namaSupplier),
              DataGridCell<String>(columnName: 'alamat', value: e.alamat),
              DataGridCell<String>(columnName: 'namaSP', value: e.namaSP),
              DataGridCell<String>(columnName: 'telepon', value: e.telepon),
              DataGridCell<String>(columnName: 'fax', value: e.fax),
              DataGridCell<String>(columnName: 'pic', value: e.pic),
              DataGridCell<String>(
                  columnName: 'tanggalDibuat', value: e.tanggalDibuat),
              DataGridCell<String>(
                  columnName: 'tanggalDiubah', value: e.tanggalDiubah),
              DataGridCell<String>(
                  columnName: 'diubahOleh', value: e.diubahOleh),
              DataGridCell<String>(
                  columnName: 'tanggalSinkron', value: e.tanggalSinkron),
            ]))
        .toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((e) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, top: 5),
        child: Text(
          e.value.toString(),
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
        ),
      );
    }).toList());
  }
}

class LaporanDataSource extends DataGridSource {
  List<DataGridRow> _laporan = [];
  @override
  List<DataGridRow> get rows => _laporan;

  LaporanDataSource({required List<TimbanganKeluarModel> laporan}) {
    _laporan = laporan
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'idLaporanKeluar', value: e.idLaporanKeluar),
              DataGridCell<String>(
                  columnName: 'idLaporanMasuk', value: e.idLaporanMasuk),
              DataGridCell<String>(
                  columnName: 'namaSupplier', value: e.namaSupplier),
              DataGridCell<String>(columnName: 'noPolisi', value: e.noPolisi),
              DataGridCell<String>(columnName: 'namaSupir', value: e.namaSupir),
              DataGridCell<String>(
                  columnName: 'namaBarang', value: e.namaBarang),
              DataGridCell<int>(columnName: 'bruto', value: e.bruto),
              DataGridCell<int>(
                  columnName: 'manualBruto', value: e.manualBruto),
              DataGridCell<String>(
                  columnName: 'konfirmasiBruto', value: e.konfirmasiBruto),
              DataGridCell<int>(columnName: 'tara', value: e.tara),
              DataGridCell<int>(columnName: 'manualTara', value: e.manualTara),
              DataGridCell<String>(
                  columnName: 'konfirmasiTara', value: e.konfirmasiTara),
              DataGridCell<int>(columnName: 'netto', value: e.netto),
              DataGridCell<int>(columnName: 'potPercent', value: e.potPercent),
              DataGridCell<int>(
                  columnName: 'beratTandan', value: e.beratTandan),
              DataGridCell<int>(
                  columnName: 'jumlahTandan', value: e.jumlahTandan),
              DataGridCell<int>(columnName: 'potAir', value: e.potAir),
              DataGridCell<int>(columnName: 'potSampah', value: e.potSampah),
              DataGridCell<int>(columnName: 'potTangkai', value: e.potTangkai),
              DataGridCell<int>(columnName: 'potPasir', value: e.potPasir),
              DataGridCell<int>(columnName: 'potMutu', value: e.potMutu),
              DataGridCell<int>(columnName: 'potMengkal', value: e.potMengkal),
              DataGridCell<int>(columnName: 'potLain', value: e.potLain),
              DataGridCell<int>(columnName: 'pulMentah', value: e.pulMentah),
              DataGridCell<int>(columnName: 'pulBusuk', value: e.pulBusuk),
              DataGridCell<int>(columnName: 'pulKosong', value: e.pulKosong),
              DataGridCell<int>(columnName: 'pulLain', value: e.pulLain),
              DataGridCell<String>(columnName: 'jamMasuk', value: e.jamMasuk),
              DataGridCell<String>(columnName: 'jamKeluar', value: e.jamKeluar),
              DataGridCell<String>(
                  columnName: 'tanggalDibuat', value: e.tanggalDibuat),
              DataGridCell<String>(
                  columnName: 'tanggalDiubah', value: e.tanggalDiubah),
              DataGridCell<String>(
                  columnName: 'diubahOleh', value: e.diubahOleh),
              DataGridCell<String>(
                  columnName: 'tanggalSinkron', value: e.tanggalSinkron),
            ]))
        .toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((e) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, top: 5),
        child: Text(
          e.value.toString(),
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
        ),
      );
    }).toList());
  }
}
