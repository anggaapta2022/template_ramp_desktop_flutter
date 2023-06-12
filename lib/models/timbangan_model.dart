class TimbanganMasukModel {
  final String idLaporan;
  final String supplier;
  final String supir;
  final String nopol;
  final String namaBarang;
  final int bruto;
  final int manualBruto;
  final String jamMasuk;
  final String konfrimasiBruto;
  TimbanganMasukModel({
    required this.idLaporan,
    required this.supplier,
    required this.supir,
    required this.nopol,
    required this.namaBarang,
    required this.bruto,
    required this.manualBruto,
    required this.jamMasuk,
    required this.konfrimasiBruto,
  });

  factory TimbanganMasukModel.fromMap(Map<String, dynamic> json) =>
      TimbanganMasukModel(
        idLaporan: json['idLaporan'] ?? '',
        supplier: json['supplier'] ?? '',
        supir: json['supir'] ?? '',
        nopol: json['nopol'] ?? '',
        namaBarang: json['namaBarang'] ?? '',
        bruto: json['bruto'] ?? 0,
        manualBruto: json['manualBruto'] ?? 0,
        jamMasuk: json['jamMasuk'] ?? '',
        konfrimasiBruto: json['konfrimasiBruto'] ?? 'Dikonfirmasi',
      );

  Map<String, dynamic> toMap() {
    return {
      'idLaporan': idLaporan,
      'supplier': supplier,
      'supir': supir,
      'nopol': nopol,
      'namaBarang': namaBarang,
      'bruto': bruto,
      'manualBruto': manualBruto,
      'jamMasuk': jamMasuk,
      'konfirmasiBruto': konfrimasiBruto,
    };
  }
}

class TimbanganKeluarModel {
  final String idLaporanKeluar;
  final String idLaporanMasuk;
  final String namaSupplier;
  final String noPolisi;
  final String namaSupir;
  final String namaBarang;
  final int bruto;
  final int manualBruto;
  final String konfirmasiBruto;
  final int tara;
  final int manualTara;
  final String konfirmasiTara;
  final int netto;
  final int potPercent;
  final int beratTandan;
  final int jumlahTandan;
  final int potAir;
  final int potSampah;
  final int potTangkai;
  final int potPasir;
  final int potMutu;
  final int potMengkal;
  final int potLain;
  final int pulMentah;
  final int pulBusuk;
  final int pulKosong;
  final int pulLain;
  final String jamMasuk;
  final String jamKeluar;
  final String tanggalDibuat;
  final String tanggalDiubah;
  final String diubahOleh;
  final String tanggalSinkron;
  TimbanganKeluarModel({
    required this.idLaporanKeluar,
    required this.idLaporanMasuk,
    required this.namaSupplier,
    required this.noPolisi,
    required this.namaSupir,
    required this.namaBarang,
    required this.bruto,
    required this.manualBruto,
    required this.konfirmasiBruto,
    required this.tara,
    required this.manualTara,
    required this.konfirmasiTara,
    required this.netto,
    required this.potPercent,
    required this.beratTandan,
    required this.jumlahTandan,
    required this.potAir,
    required this.potSampah,
    required this.potTangkai,
    required this.potPasir,
    required this.potMutu,
    required this.potMengkal,
    required this.potLain,
    required this.pulMentah,
    required this.pulBusuk,
    required this.pulKosong,
    required this.pulLain,
    required this.jamMasuk,
    required this.jamKeluar,
    required this.tanggalDibuat,
    required this.tanggalDiubah,
    required this.diubahOleh,
    required this.tanggalSinkron,
  });

  factory TimbanganKeluarModel.fromMap(Map<String, dynamic> json) =>
      TimbanganKeluarModel(
        idLaporanKeluar: json['idLaporanKeluar'] ?? '',
        idLaporanMasuk: json['idLaporanMasuk'] ?? '',
        namaSupplier: json['namaSupplier'] ?? '',
        noPolisi: json['noPolisi'] ?? '',
        namaSupir: json['namaSupir'] ?? '',
        namaBarang: json['namaBarang'] ?? '',
        bruto: json['bruto'] ?? 0,
        manualBruto: json['manualBruto'] ?? 0,
        konfirmasiBruto: json['konfirmasiBruto'] ?? '',
        tara: json['tara'] ?? 0,
        manualTara: json['manualTara'] ?? 0,
        konfirmasiTara: json['konfirmasiTara'] ?? '',
        netto: json['netto'] ?? 0,
        potPercent: json['potPercent'] ?? 0,
        beratTandan: json['beratTandan'] ?? 0,
        jumlahTandan: json['potPercent'] ?? 0,
        potAir: json['potAir'] ?? 0,
        potSampah: json['potSampah'] ?? 0,
        potTangkai: json['potTangkai'] ?? 0,
        potPasir: json['potPasir'] ?? 0,
        potMutu: json['potMutu'] ?? 0,
        potMengkal: json['potMengkal'] ?? 0,
        potLain: json['potLain'] ?? 0,
        pulMentah: json['pulMentah'] ?? 0,
        pulBusuk: json['pulBusuk'] ?? 0,
        pulKosong: json['pulKosong'] ?? 0,
        pulLain: json['pulLain'] ?? 0,
        jamMasuk: json['jamMasuk'] ?? '',
        jamKeluar: json['jamKeluar'] ?? '',
        tanggalDibuat: json['tanggalDibuat'] ?? '',
        tanggalDiubah: json['tanggalDiubah'] ?? '',
        diubahOleh: json['diubahOleh'] ?? '',
        tanggalSinkron: json['tanggalSinkron'] ?? '',
      );

  Map<String, dynamic> toMap() {
    return {
      'idLaporanKeluar': idLaporanKeluar,
      'idLaporanMasuk': idLaporanMasuk,
      'namaSupplier': namaSupplier,
      'noPolisi': noPolisi,
      'namaSupir': namaSupir,
      'namaBarang': namaBarang,
      'bruto': bruto,
      'manualBruto': manualBruto,
      'konfirmasiBruto': konfirmasiBruto,
      'tara': tara,
      'manualTara': manualTara,
      'konfirmasiTara': konfirmasiTara,
      'netto': netto,
      'potPercent': potPercent,
      'beratTandan': beratTandan,
      'jumlahTandan': jumlahTandan,
      'potAir': potAir,
      'potSampah': potSampah,
      'potTangkai': potTangkai,
      'potPasir': potPasir,
      'potMutu': potMutu,
      'potMengkal': potMengkal,
      'potLain': potLain,
      'pulMentah': pulMentah,
      'pulBusuk': pulBusuk,
      'pulKosong': pulKosong,
      'pulLain': pulLain,
      'jamMasuk': jamMasuk,
      'jamKeluar': jamKeluar,
      'tanggalDibuat': tanggalDibuat,
      'tanggalDiubah': tanggalDiubah,
      'diubahOleh': diubahOleh,
      'tanggalSinkron': tanggalSinkron,
    };
  }
}
