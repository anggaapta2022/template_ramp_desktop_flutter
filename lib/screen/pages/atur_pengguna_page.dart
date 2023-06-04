part of './pages.dart';

class AturPenggunaPage extends StatelessWidget {
  const AturPenggunaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 500,
          width: 500,
          child: lottie.Lottie.asset('assets/indevelop.json'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Halaman ini sedang dalam tahap pengembangan",
          style: greyTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      ],
    );
  }
}
