part of './pages.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  final int rowsPerPage = 10;
  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();
  List<Laporan> laporan = <Laporan>[];
  late LaporanDataSource laporanDataSource;
  List<Laporan> getLaporan() {
    return [
      Laporan(
          "LP-12128318231",
          "Supplier 1",
          "Budi",
          "BM 1234 ENK",
          "Super",
          "0.0",
          "2500 kg",
          "2023-06-04 13:24",
          "Terkonfirmai",
          "0.0",
          "500 kg",
          "2023-06-04 15:23",
          "Terkonfirmasi",
          "100 kg",
          "10 %",
          "250 kg",
          "1500 kg",
          "2023-06-04",
          "5 kg",
          "5 kg",
          "10 kg",
          "10 kg",
          "10 kg",
          "10 kg",
          "10 kg",
          "0 kg",
          "0 kg",
          "0 kg",
          "0 kg",
          "0 kg")
    ];
  }

  @override
  void initState() {
    super.initState();
    laporan = getLaporan();
    laporanDataSource = LaporanDataSource(laporan: laporan);
  }

  @override
  Widget build(BuildContext context) {
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
          source: laporanDataSource,
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
              columnName: "idLaporan",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'ID Laporan',
                ),
              ),
            ),
            GridColumn(
              columnName: "supplier",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Suppliler',
                ),
              ),
            ),
            GridColumn(
              columnName: "supir",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'supir',
                ),
              ),
            ),
            GridColumn(
              columnName: "nopol",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'No. Polisi',
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
              columnName: "bruto",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Bruto',
                ),
              ),
            ),
            GridColumn(
              columnName: "manualBruto",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Manual Bruto',
                ),
              ),
            ),
            GridColumn(
              columnName: "jamMasuk",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Jam Masuk',
                ),
              ),
            ),
            GridColumn(
              columnName: "konfirmasiBruto",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'KonfirmasiBruto',
                ),
              ),
            ),
            GridColumn(
              columnName: "tara",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Tara',
                ),
              ),
            ),
            GridColumn(
              columnName: "manualTara",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Manual Tara',
                ),
              ),
            ),
            GridColumn(
              columnName: "jamKeluar",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Jam Keluar',
                ),
              ),
            ),
            GridColumn(
              columnName: "konfirmasiTara",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Konfirmasi Tara',
                ),
              ),
            ),
            GridColumn(
              columnName: "netto",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Netto',
                ),
              ),
            ),
            GridColumn(
              columnName: "Potongan Percent",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Potongan Percent',
                ),
              ),
            ),
            GridColumn(
              columnName: "potonganBerat",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Potongan Berat',
                ),
              ),
            ),
            GridColumn(
              columnName: "beratTerima",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Berat Terima',
                ),
              ),
            ),
            GridColumn(
              columnName: "tanggalTimbang",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Tanggal Timbang',
                ),
              ),
            ),
            GridColumn(
              columnName: "beratTandan",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Berat Tandan',
                ),
              ),
            ),
            GridColumn(
              columnName: "jumlahTandan",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Jumlah Tandan',
                ),
              ),
            ),
            GridColumn(
              columnName: "air",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Air',
                ),
              ),
            ),
            GridColumn(
              columnName: "sampah",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Sampah',
                ),
              ),
            ),
            GridColumn(
              columnName: "tangkai",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Tangkai',
                ),
              ),
            ),
            GridColumn(
              columnName: "pasir",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Pasir',
                ),
              ),
            ),
            GridColumn(
              columnName: "mutu",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Mutu',
                ),
              ),
            ),
            GridColumn(
              columnName: "potonganLain",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Pot-Lain Lain',
                ),
              ),
            ),
            GridColumn(
              columnName: "mentah",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Mentah',
                ),
              ),
            ),
            GridColumn(
              columnName: "busuk",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Busuk',
                ),
              ),
            ),
            GridColumn(
              columnName: "kosong",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Kosong',
                ),
              ),
            ),
            GridColumn(
              columnName: "pulanganLain",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Pul-Lain Lain',
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget pagination() {
      return SfDataPager(
          pageCount: laporan.length / rowsPerPage, delegate: laporanDataSource);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halaman Laporan",
          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ButtonExport(),
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
