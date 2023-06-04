part of './pages.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  final int rowsPerPage = 10;
  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();
  List<Supplier> supplier = <Supplier>[];
  late SupplierDataSource supplierDataSource;
  List<Supplier> getSupplier() {
    return [
      Supplier("Supplier-12312912", "Supplier 1", "Jl. Supplier 1", "SP1",
          "0812172171", "924", "Anto"),
      Supplier("Supplier-82172818", "Supplier 2", "Jl. Supplier 2", "SP2",
          "0812172171", "924", "Budi"),
    ];
  }

  @override
  void initState() {
    super.initState();
    supplier = getSupplier();
    supplierDataSource = SupplierDataSource(supplier: supplier);
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonCreateSupplier() {
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
                  "Tambah Supplier",
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
          source: supplierDataSource,
          columnWidthMode: ColumnWidthMode.fill,
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
          ],
        ),
      );
    }

    Widget pagination() {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ButtonExport(),
                buttonCreateSupplier(),
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
