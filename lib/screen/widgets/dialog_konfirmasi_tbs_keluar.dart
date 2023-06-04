part of './widgets.dart';

class DialogKonfirmasiTBSKeluar extends StatelessWidget {
  const DialogKonfirmasiTBSKeluar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.5,
      height: context.height * 0.6,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Konfimasi Input TBS Keluar",
              style: blackTextStyle.copyWith(fontSize: 26, fontWeight: bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Periksa kembali data input anda",
              style: greyTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No. Faktur: ",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Jam Masuk: ",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Supplier: ",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "No. Polisi: ",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Supir: ",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Barang: ",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Berat Tara: ",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Berat Tara Manual: ",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Potongan Percent: ",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
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
