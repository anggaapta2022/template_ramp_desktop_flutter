// ignore_for_file: use_build_context_synchronously

part of './widgets.dart';

class DialogKonfirmasiTBSMasuk extends StatelessWidget {
  final String supplier;
  final String nopol;
  final String supir;
  final String namaBarang;
  final String bruto;
  final String manualBruto;
  final String idLaporan;
  final String jamMasuk;
  final String konfirmasiBruto;
  const DialogKonfirmasiTBSMasuk(
      {super.key,
      required this.supplier,
      required this.nopol,
      required this.supir,
      required this.namaBarang,
      required this.bruto,
      required this.manualBruto,
      required this.idLaporan,
      required this.jamMasuk,
      this.konfirmasiBruto = "Dikonfirmasi"});

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);
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
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Konfimasi Input TBS Masuk",
                    style:
                        blackTextStyle.copyWith(fontSize: 26, fontWeight: bold),
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
                      "No. Faktur:  $idLaporan",
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Jam Masuk:  $jamMasuk",
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Supplier:  $supplier",
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "No. Polisi:  $nopol",
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Supir:  $supir",
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
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                            await DataTimbanganMasuk().addTimbanganMasuk(
                                TimbanganMasukModel(
                                    idLaporan: idLaporan,
                                    supplier: supplier,
                                    supir: supir,
                                    nopol: nopol,
                                    namaBarang: namaBarang,
                                    bruto: int.parse(bruto),
                                    manualBruto: int.parse(manualBruto),
                                    jamMasuk: jamMasuk,
                                    konfrimasiBruto: konfirmasiBruto));
                            globalProvider.supplierController.text = "";
                            globalProvider.nopolController.text = "";
                            globalProvider.supirController.text = "";
                            globalProvider.barangController.text = "";
                            globalProvider.inputManualController.text = "";
                            globalProvider.idLaporan =
                                "FP-${DateFormat('dd/MM/yy').format(DateTime.now())}/${randomNumeric(4)}";
                            await DataTimbanganMasuk()
                                .getDataTimbanganMasuk()
                                .whenComplete(() {
                              globalProvider.loading = true;
                              Timer(const Duration(seconds: 2), () {
                                globalProvider.loading = false;
                                context.pop();
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
    );
  }
}
