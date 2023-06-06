class SupplierModel {
  final String idSupplier;
  final String kodeGroup;
  final String namaSupplier;
  final String alamat;
  final String namaSP;
  final String telepon;
  final String fax;
  final String pic;
  final String tanggalDibuat;
  final String tanggalDiubah;
  final String diubahOleh;
  final String tanggalSinkron;
  SupplierModel({
    required this.idSupplier,
    required this.kodeGroup,
    required this.namaSupplier,
    required this.alamat,
    required this.namaSP,
    required this.telepon,
    required this.fax,
    required this.pic,
    required this.tanggalDibuat,
    required this.tanggalDiubah,
    required this.diubahOleh,
    required this.tanggalSinkron,
  });

  factory SupplierModel.fromMap(Map<String, dynamic> json) => SupplierModel(
        idSupplier: json['idSupplier'] ?? '',
        kodeGroup: json['kodeGroup'] ?? '',
        namaSupplier: json['namaSupplier'] ?? '',
        alamat: json['alamat'] ?? '',
        namaSP: json['namaSP'] ?? '',
        telepon: json['telepon'] ?? '',
        fax: json['fax'] ?? '',
        pic: json['pic'] ?? '',
        tanggalDibuat: json['tanggalDibuat'] ?? '',
        tanggalDiubah: json['tanggalDiubah'] ?? '',
        diubahOleh: json['diubahOleh'] ?? '',
        tanggalSinkron: json['tanggalSinkron'] ?? '',
      );

  Map<String, dynamic> toMap() {
    return {
      'idSupplier': idSupplier,
      'kodeGroup': kodeGroup,
      'namaSupplier': namaSupplier,
      'alamat': alamat,
      'namaSP': namaSP,
      'telepon': telepon,
      'fax': fax,
      'pic': pic,
      'tanggalDibuat': tanggalDibuat,
      'tanggalDiubah': tanggalDiubah,
      'diubahOleh': diubahOleh,
      'tanggalSinkron': tanggalSinkron,
    };
  }
}
