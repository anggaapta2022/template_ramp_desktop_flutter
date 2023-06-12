part of './widgets.dart';

class UnPlug extends StatelessWidget {
  const UnPlug({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.5,
      height: context.width * 0.5,
      padding: const EdgeInsets.all(36),
      decoration:
          BoxDecoration(color: cWhite, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.width * 0.2,
            height: context.width * 0.2,
            child: lottie.Lottie.asset('assets/unplug.json'),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Setelah melakukan pemutusan koneksi silahkan cabut port timbangan yang terhubung ke USB port agar tidak terjadi error pada aplikasi",
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    color: cBlue.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Kembali",
                    style: whiteTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
