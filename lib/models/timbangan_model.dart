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
