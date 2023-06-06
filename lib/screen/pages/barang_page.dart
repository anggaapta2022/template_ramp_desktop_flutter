// ignore_for_file: avoid_print

part of './pages.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  int rowsPerPage = 10;
  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();
  List<BarangModel> barang = <BarangModel>[];
  late BarangDataSource barangDataSource;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildDataGrid(BarangDataSource barangDataSource) {
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
          columnWidthMode: ColumnWidthMode.fitByColumnName,
          frozenColumnsCount: 2,
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
              columnName: "satuanBarang",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Satuan Barang',
                ),
              ),
            ),
            GridColumn(
              columnName: "tanggalDibuat",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Tanggal Dibuat',
                ),
              ),
            ),
            GridColumn(
              columnName: "tanggalDiubah",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Tanggal Diubah',
                ),
              ),
            ),
            GridColumn(
              columnName: "diubahOleh",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Diubah',
                ),
              ),
            ),
            GridColumn(
              columnName: "tanggalSinkron",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Tanggal Sinkron',
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget pagination(BarangDataSource barangDataSource) {
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
        child: FutureBuilder(
            future: DataBarang().getDataBarang(),
            builder: (context, snapshot) {
              print("isi data: ${snapshot.data}");
              if (snapshot.data != null) {
                barang = snapshot.data;
                barangDataSource = BarangDataSource(barang: barang);
              }
              return !snapshot.hasData
                  ? Center(
                      child: CircularProgressIndicator(color: cBlue),
                    )
                  : snapshot.data!.isEmpty
                      ? Center(
                          child: Text(
                            "Tidak ada data",
                            style: greyTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ButtonExport(),
                            LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: context.height * 0.7,
                                        child: buildDataGrid(barangDataSource)),
                                    pagination(barangDataSource),
                                  ],
                                );
                              },
                            ),
                          ],
                        );
            }),
      ),
    );
  }
}
