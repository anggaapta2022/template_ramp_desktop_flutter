// ignore_for_file: use_build_context_synchronously

part of './pages.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 100, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "oh tidak!",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: regular),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "tidak ada koneksi internet.",
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: light),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "periksa kembali jaringan anda dan coba kembali.",
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: light),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: lottie.Lottie.asset('assets/no-internet.json'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              globalProvider.loading == false
                  ? GestureDetector(
                      onTap: () async {
                        await ConnectivityUtil.checkConnectivity(context);
                        if (ConnectivityUtil.isConnected()) {
                          // Kembali ke halaman sebelumnya
                          context.pop();
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 50,
                        decoration: BoxDecoration(
                            color: cBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Periksa Kembali",
                            style: whiteTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: cBlue,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
