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

class Laporan {
  Laporan(
      this.idLaporan,
      this.supplier,
      this.supir,
      this.nopol,
      this.namaBarang,
      this.bruto,
      this.manualBruto,
      this.jamMasuk,
      this.konfirmasiBruto,
      this.tara,
      this.manualTara,
      this.jamKeluar,
      this.konfirmasiTara,
      this.netto,
      this.potonganPercent,
      this.potonganBerat,
      this.beratTerima,
      this.tanggalTimbang,
      this.beratTandan,
      this.jumlahTandan,
      this.air,
      this.sampah,
      this.tangkai,
      this.pasir,
      this.mutu,
      this.potonganLain,
      this.mentah,
      this.busuk,
      this.kosong,
      this.pulanganLain);
  final String idLaporan;
  final String supplier;
  final String supir;
  final String nopol;
  final String namaBarang;
  final String bruto;
  final String manualBruto;
  final String jamMasuk;
  final String konfirmasiBruto;
  final String tara;
  final String manualTara;
  final String jamKeluar;
  final String konfirmasiTara;
  final String netto;
  final String potonganPercent;
  final String potonganBerat;
  final String beratTerima;
  final String tanggalTimbang;
  final String beratTandan;
  final String jumlahTandan;
  final String air;
  final String sampah;
  final String tangkai;
  final String pasir;
  final String mutu;
  final String potonganLain;
  final String mentah;
  final String busuk;
  final String kosong;
  final String pulanganLain;
}

class LaporanDataSource extends DataGridSource {
  List<DataGridRow> _laporan = [];
  @override
  List<DataGridRow> get rows => _laporan;

  LaporanDataSource({required List<Laporan> laporan}) {
    _laporan = laporan
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'idLaporan', value: e.idLaporan),
              DataGridCell<String>(columnName: 'supplier', value: e.supplier),
              DataGridCell<String>(columnName: 'supir', value: e.supir),
              DataGridCell<String>(columnName: 'nopol', value: e.nopol),
              DataGridCell<String>(
                  columnName: 'namaBarang', value: e.namaBarang),
              DataGridCell<String>(columnName: 'bruto', value: e.bruto),
              DataGridCell<String>(
                  columnName: 'manualBruto', value: e.manualBruto),
              DataGridCell<String>(columnName: 'jamMasuk', value: e.jamMasuk),
              DataGridCell<String>(
                  columnName: 'konfirmasiBruto', value: e.konfirmasiBruto),
              DataGridCell<String>(columnName: 'tara', value: e.tara),
              DataGridCell<String>(
                  columnName: 'manualTara', value: e.manualTara),
              DataGridCell<String>(columnName: 'jamKeluar', value: e.jamKeluar),
              DataGridCell<String>(
                  columnName: 'konfirmasiTara', value: e.konfirmasiTara),
              DataGridCell<String>(columnName: 'netto', value: e.netto),
              DataGridCell<String>(
                  columnName: 'potonganPercent', value: e.potonganPercent),
              DataGridCell<String>(
                  columnName: 'potonganBerat', value: e.potonganBerat),
              DataGridCell<String>(
                  columnName: 'beratTerima', value: e.beratTerima),
              DataGridCell<String>(
                  columnName: 'tanggalTimbang', value: e.tanggalTimbang),
              DataGridCell<String>(
                  columnName: 'beratTandan', value: e.beratTandan),
              DataGridCell<String>(
                  columnName: 'jumlahTandan', value: e.jumlahTandan),
              DataGridCell<String>(columnName: 'air', value: e.air),
              DataGridCell<String>(columnName: 'sampah', value: e.sampah),
              DataGridCell<String>(columnName: 'tangkai', value: e.tangkai),
              DataGridCell<String>(columnName: 'pasir', value: e.pasir),
              DataGridCell<String>(columnName: 'mutu', value: e.mutu),
              DataGridCell<String>(
                  columnName: 'potonganLain', value: e.potonganLain),
              DataGridCell<String>(columnName: 'mentah', value: e.mentah),
              DataGridCell<String>(columnName: 'busuk', value: e.busuk),
              DataGridCell<String>(columnName: 'kosong', value: e.kosong),
              DataGridCell<String>(
                  columnName: 'pulanganLain', value: e.pulanganLain),
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
