part of './pages.dart';

class TBSPage extends StatelessWidget {
  const TBSPage({super.key});

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Halaman TBS",
            style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: cBlue,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: Text(
                  "TBS Masuk",
                  style:
                      blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
              ),
              Tab(
                child: Text(
                  "TBS Keluar",
                  style:
                      blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const TBSMasukPage(),
            TBSKeluarPage(idSelected: globalProvider.dataTab),
          ],
        ),
      ),
    );
  }
}
