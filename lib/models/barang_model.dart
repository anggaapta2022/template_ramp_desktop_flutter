class BarangModel {
  final String idBarang;
  final String namaBarang;
  final String tipeBarang;
  final String satuanBarang;
  final String tanggalDibuat;
  final String tanggalDiubah;
  final String diubahOleh;
  final String tanggalSinkron;
  BarangModel({
    required this.idBarang,
    required this.namaBarang,
    required this.tipeBarang,
    required this.satuanBarang,
    required this.tanggalDibuat,
    required this.tanggalDiubah,
    required this.diubahOleh,
    required this.tanggalSinkron,
  });

  factory BarangModel.fromMap(Map<String, dynamic> json) => BarangModel(
        idBarang: json['idBarang'] ?? '',
        namaBarang: json['namaBarang'] ?? '',
        tipeBarang: json['tipeBarang'] ?? '',
        satuanBarang: json['satuanBarang'] ?? '',
        tanggalDibuat: json['tanggalDibuat'] ?? '',
        tanggalDiubah: json['tanggalDiubah'] ?? '',
        diubahOleh: json['diubahOleh'] ?? '',
        tanggalSinkron: json['tanggalSinkron'] ?? '',
      );

  Map<String, dynamic> toMap() {
    return {
      'idBarang': idBarang,
      'namaBarang': namaBarang,
      'tipeBarang': tipeBarang,
      'satuanBarang': satuanBarang,
      'tanggalDibuat': tanggalDibuat,
      'tanggalDiubah': tanggalDiubah,
      'diubahOleh': diubahOleh,
      'tanggalSinkron': tanggalSinkron,
    };
  }
}
