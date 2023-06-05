part of './pages.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  final int rowsPerPage = 10;
  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();
  List<Barang> barang = <Barang>[];
  late BarangDataSource barangDataSource;
  List<Barang> getBarang() {
    return [
      Barang("Barang-012129312", "Super", "Buah", "kg"),
      Barang("Barang-012312881", "Besar", "Buah", "kg"),
      Barang("Barang-921121900", "Sedang", "Buah", "kg"),
      Barang("Barang-921881999", "Kecil", "Buah", "kg"),
      Barang("Barang-731618288", "CPO", "Produk", "kg"),
      Barang("Barang-635161778", "Kernel", "Produk", "kg"),
    ];
  }

  @override
  void initState() {
    super.initState();
    barang = getBarang();
    barangDataSource = BarangDataSource(barang: barang);
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonCreateBarang() {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: cBlue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tambah Barang",
                  style: whiteTextStyle.copyWith(
                      fontSize: 12, fontWeight: semiBold),
                ),
                const SizedBox(
                  width: 5,
                ),
                FaIcon(
                  FontAwesomeIcons.plus,
                  size: 16,
                  color: cWhite,
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget buildDataGrid() {
      return SfDataGridTheme(
        data: SfDataGridThemeData(
            rowHoverColor: cBlue.withOpacity(0.7),
            rowHoverTextStyle: const TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
            headerColor: cBlue.withOpacity(0.5),
            headerHoverColor: cBlue.withOpacity(0.25),
            sortOrderNumberBackgroundColor: cGreen.withOpacity(0.7),
            sortOrderNumberColor: cRed.withOpacity(0.7)),
        child: SfDataGrid(
          key: key,
          source: barangDataSource,
          columnWidthMode: ColumnWidthMode.fill,
          allowSorting: true,
          allowFiltering: true,
          allowMultiColumnSorting: true,
          showSortNumbers: true,
          allowSwiping: true,
          swipeMaxOffset: 100,
          columns: [
            GridColumn(
              columnName: "idBarang",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'ID Barang',
                ),
              ),
            ),
            GridColumn(
              columnName: "namaBarang",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Nama Barang',
                ),
              ),
            ),
            GridColumn(
              columnName: "tipeBarang",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Tipe Barang',
                ),
              ),
            ),
            GridColumn(
              columnName: "satuan",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Satuan',
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget pagination() {
      return SfDataPager(
          pageCount: barang.length / rowsPerPage, delegate: barangDataSource);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halaman Barang",
          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ButtonExport(),
                buttonCreateBarang(),
              ],
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: context.height * 0.7, child: buildDataGrid()),
                    pagination(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
