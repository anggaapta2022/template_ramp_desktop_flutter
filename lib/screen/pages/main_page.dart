part of './pages.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required SidebarXController controller})
      : _controller = controller;
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    var pageProvider = Provider.of<PageProvider>(context);
    Widget titleBarBox() {
      return SizedBox(
        // color: cBlue.withOpacity(0.5),
        child: WindowTitleBarBox(
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon.png'),
                  ),
                ),
              ),
              Text(
                "WBMS Desktop",
                style: whiteTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold, color: cBlack),
              ),
              Expanded(child: MoveWindow()),
              const WindowButtons(),
            ],
          ),
        ),
      );
    }

    Widget sideMenu() {
      return SidebarX(
        controller: _controller,
        theme: SidebarXTheme(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: cBlue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          hoverColor: cWhite.withOpacity(0.2),
          textStyle: whiteTextStyle.copyWith(fontSize: 14, fontWeight: regular),
          selectedTextStyle:
              whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          itemTextPadding: const EdgeInsets.only(left: 20),
          selectedItemTextPadding: const EdgeInsets.only(left: 20),
          itemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [cBlue, cBlue.withOpacity(0.5)],
            ),
            boxShadow: [
              BoxShadow(
                color: cBlack.withOpacity(0.35),
                blurRadius: 25,
              )
            ],
          ),
          iconTheme: IconThemeData(
            color: cWhite.withOpacity(0.5),
            size: 26,
          ),
          selectedIconTheme: IconThemeData(
            color: cWhite,
            size: 26,
          ),
        ),
        extendedTheme: SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(
            color: cBlue.withOpacity(0.5),
          ),
        ),
        headerBuilder: (context, extended) {
          return const SizedBox(
            height: 50,
          );
        },
        items: [
          SidebarXItem(
            icon: FontAwesomeIcons.scaleBalanced,
            label: 'TBS',
            onTap: () {
              pageProvider.page = 0;
              SidebarXController(selectedIndex: 0);
            },
          ),
          SidebarXItem(
              icon: FontAwesomeIcons.truckRampBox,
              label: 'Barang',
              onTap: () {
                pageProvider.page = 1;
                SidebarXController(selectedIndex: 1);
              }),
          SidebarXItem(
              icon: FontAwesomeIcons.truckFast,
              label: 'Supplier',
              onTap: () {
                pageProvider.page = 2;
                SidebarXController(selectedIndex: 2);
              }),
          SidebarXItem(
              icon: FontAwesomeIcons.fileSignature,
              label: 'Laporan',
              onTap: () {
                pageProvider.page = 3;
                SidebarXController(selectedIndex: 3);
              }),
          SidebarXItem(
              icon: FontAwesomeIcons.listCheck,
              label: 'Indikator',
              onTap: () {
                pageProvider.page = 4;
                SidebarXController(selectedIndex: 4);
              }),
          SidebarXItem(
              icon: FontAwesomeIcons.usersGear,
              label: 'Atur Pengguna',
              onTap: () {
                pageProvider.page = 5;
                SidebarXController(selectedIndex: 5);
              }),
        ],
      );
    }

    Widget buildScreen(int index) {
      switch (index) {
        case 0:
          return const TBSPage();
        case 1:
          return const BarangPage();
        case 2:
          return const SupplierPage();
        case 3:
          return const LaporanPage();
        case 4:
          return const IndikatorPage();
        case 5:
          return const AturPenggunaPage();
        default:
          return const TBSPage();
      }
    }

    return Consumer<PageProvider>(builder: (context, pageProvider, child) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleBarBox(),
            Expanded(
              child: Row(
                children: [
                  sideMenu(),
                  Expanded(
                    child: buildScreen(pageProvider.page),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: cBlack,
    mouseOver: cBlue,
    mouseDown: cBlue,
    iconMouseOver: cWhite,
    iconMouseDown: cWhite);

final closeButtonColors = WindowButtonColors(
    mouseOver: cRed,
    mouseDown: cRed,
    iconNormal: cBlack,
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}

const scaffoldBackgroundColor = Color(0xFF464667);
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: cWhite.withOpacity(0.3), height: 1);
