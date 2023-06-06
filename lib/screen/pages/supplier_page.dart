// ignore_for_file: avoid_print

part of './pages.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  int rowsPerPage = 10;
  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();
  List<SupplierModel> supplier = <SupplierModel>[];
  late SupplierDataSource supplierDataSource;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildDataGrid(SupplierDataSource supplierDataSource) {
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
          source: supplierDataSource,
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
              columnName: "idSupplier",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'ID Supplier',
                ),
              ),
            ),
            GridColumn(
              columnName: "kodeGroup",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Kode Group',
                ),
              ),
            ),
            GridColumn(
              columnName: "namaSupplier",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Nama Supplier',
                ),
              ),
            ),
            GridColumn(
              columnName: "alamat",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Alamat',
                ),
              ),
            ),
            GridColumn(
              columnName: "namaSP",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Nama SP',
                ),
              ),
            ),
            GridColumn(
              columnName: "telepon",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Telepon',
                ),
              ),
            ),
            GridColumn(
              columnName: "fax",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Fax',
                ),
              ),
            ),
            GridColumn(
              columnName: "pic",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'PIC',
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

    Widget pagination(SupplierDataSource supplierDataSource) {
      return SfDataPager(
          pageCount: supplier.length / rowsPerPage,
          delegate: supplierDataSource);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halaman Supplier",
          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
        child: FutureBuilder(
            future: DataSupplier().getDataSupplier(),
            builder: (context, snapshot) {
              print("isi data: ${snapshot.data}");
              if (snapshot.data != null) {
                supplier = snapshot.data;
                supplierDataSource = SupplierDataSource(supplier: supplier);
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
                                        child:
                                            buildDataGrid(supplierDataSource)),
                                    pagination(supplierDataSource),
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
