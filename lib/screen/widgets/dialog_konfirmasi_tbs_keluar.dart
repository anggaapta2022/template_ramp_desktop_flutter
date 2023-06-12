part of './widgets.dart';

class DialogKonfirmasiTBSKeluar extends StatelessWidget {
  final String idLaporanKeluar;
  final String namaSupplier;
  final String noPolisi;
  final String namaSupir;
  final String namaBarang;
  final String idLaporanMasuk;
  final String bruto;
  final String manualBruto;
  final String tara;
  final String manualTara;
  final String potPercent;
  final String netto;
  final String beratTandan;
  final String jumlahTandan;
  final String potAir;
  final String potSampah;
  final String potTangkai;
  final String potPasir;
  final String potMutu;
  final String potMengkal;
  final String potLain;
  final String pulMentah;
  final String pulBusuk;
  final String pulKosong;
  final String pulLain;
  final String jamMasuk;

  const DialogKonfirmasiTBSKeluar({
    super.key,
    required this.idLaporanKeluar,
    required this.namaSupplier,
    required this.noPolisi,
    required this.namaSupir,
    required this.namaBarang,
    required this.idLaporanMasuk,
    required this.bruto,
    required this.manualBruto,
    required this.tara,
    required this.manualTara,
    required this.potPercent,
    required this.netto,
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
  });

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);
    var pageProvider = Provider.of<PageProvider>(context);
    var timKeluarProvider = Provider.of<TimbanganKeluarProvider>(context);
    return Container(
      width: context.width * 0.5,
      height: context.height * 0.6,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: globalProvider.loading
          ? Center(
              child: SizedBox(
                height: 250,
                width: 250,
                child: lottie.Lottie.asset('assets/waiting_input.json'),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Konfimasi Input TBS Keluar",
                      style: blackTextStyle.copyWith(
                          fontSize: 26, fontWeight: bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Periksa kembali data input anda",
                      style: greyTextStyle.copyWith(
                          fontSize: 22, fontWeight: semiBold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "No. Faktur:  $idLaporanKeluar",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Nama Supplier:  $namaSupplier",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "No. Polis:  $noPolisi",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Nama Supir:  $namaSupir",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Nama Barang:  $namaBarang",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Id Laporan Masuk:  $idLaporanMasuk",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Berat Bruto:  $bruto",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Berat Bruto Manual:  $manualBruto",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Berat Tara:  ${tara.isEmpty ? 0 : tara}",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Berat Tara Manual:  $manualTara",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Potongan Percent:  $potPercent",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Netto:  $netto",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Berat Tandan:  $beratTandan",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Jumlah Tandan:  $jumlahTandan",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Potongan Air:  $potAir",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Potongan Sampah:  $potSampah",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Potongan Tangkai:  $potTangkai",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Potongan Pasir:  $potPasir",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Potongan Mutu:  $potMutu",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Potongan Mengkal:  $potMengkal",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Potongan Lain-lain:  $potLain",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pulangan Mentah:  $pulMentah",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pulangan Busuk:  $pulBusuk",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pulangan Kosong:  $pulKosong",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pulangan Lain-lain:  $pulLain",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => context.pop(),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: cRed.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: Text(
                                  "Batal",
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 18, fontWeight: semiBold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () async {
                              await DataTimbanganKeluar().addTimbanganKeluar(
                                  TimbanganKeluarModel(
                                      idLaporanKeluar: idLaporanKeluar,
                                      idLaporanMasuk: idLaporanMasuk,
                                      namaSupplier: namaSupplier,
                                      noPolisi: noPolisi,
                                      namaSupir: namaSupir,
                                      namaBarang: namaBarang,
                                      bruto: int.parse(bruto),
                                      manualBruto: int.parse(manualBruto),
                                      konfirmasiBruto: "Dikonfirmasi",
                                      tara: tara.isEmpty ? 0 : int.parse(tara),
                                      manualTara: int.parse(manualTara),
                                      konfirmasiTara: "Dikonfirmasi",
                                      netto: int.parse(netto),
                                      potPercent: int.parse(potPercent),
                                      beratTandan: int.parse(beratTandan),
                                      jumlahTandan: int.parse(jumlahTandan),
                                      potAir: int.parse(potAir),
                                      potSampah: int.parse(potSampah),
                                      potTangkai: int.parse(potTangkai),
                                      potPasir: int.parse(potPasir),
                                      potMutu: int.parse(potMutu),
                                      potMengkal: int.parse(potMengkal),
                                      potLain: int.parse(potLain),
                                      pulMentah: int.parse(pulMentah),
                                      pulBusuk: int.parse(pulBusuk),
                                      pulKosong: int.parse(pulKosong),
                                      pulLain: int.parse(pulLain),
                                      jamMasuk: jamMasuk,
                                      jamKeluar:
                                          DateFormat('yyyy-MM-dd HH:mm:ss')
                                              .format(DateTime.now()),
                                      tanggalDibuat: DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now()),
                                      tanggalDiubah: DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now()),
                                      diubahOleh: "SYSTEM",
                                      tanggalSinkron: DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now())));
                              timKeluarProvider.inputManualController.text = "";
                              timKeluarProvider.potonganPercentController.text =
                                  "";
                              timKeluarProvider.beratTandanController.text = "";
                              timKeluarProvider.jumlahTandanController.text =
                                  "";
                              timKeluarProvider.airController.text = "";
                              timKeluarProvider.sampahController.text = "";
                              timKeluarProvider.tangkaiController.text = "";
                              timKeluarProvider.pasirController.text = "";
                              timKeluarProvider.mutuController.text = "";
                              timKeluarProvider.mengkalController.text = "";
                              timKeluarProvider.potonganLainController.text =
                                  "";
                              timKeluarProvider.mentahController.text = "";
                              timKeluarProvider.busukController.text = "";
                              timKeluarProvider.kosongController.text = "";
                              timKeluarProvider.pulanganLainController.text =
                                  "";
                              timKeluarProvider.idLaporanKeluar =
                                  "FP-${DateFormat('dd/MM/yy').format(DateTime.now())}/${randomNumeric(4)}";
                              await DataTimbanganKeluar()
                                  .getDataTimbanganKeluar()
                                  .whenComplete(() {
                                globalProvider.loading = true;
                                Timer(const Duration(seconds: 2), () {
                                  globalProvider.loading = false;
                                  context.pop();
                                  pageProvider.page = 0;
                                });
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: cBlue,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: Text(
                                  "Konfirmasi",
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 18, fontWeight: semiBold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
    );
  }
}
