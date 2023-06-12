part of './pages.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  final int rowsPerPage = 10;
  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();
  List<TimbanganKeluarModel> laporan = <TimbanganKeluarModel>[];
  late LaporanDataSource laporanDataSource;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildDataGrid(LaporanDataSource laporanDataSource) {
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
              columnName: "idLaporanKeluar",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'ID Laporan Keluar',
                ),
              ),
            ),
            GridColumn(
              columnName: "idLaporanMasuk",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'ID Laporan Masuk',
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
              columnName: "noPolisi",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'No. Polisi',
                ),
              ),
            ),
            GridColumn(
              columnName: "namaSupir",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Nama Supir',
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
              columnName: "konfirmasiBruto",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Konfirmasi Bruto',
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
              columnName: "potPercent",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Potongan Percent',
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
              columnName: "potAir",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Potongan Air',
                ),
              ),
            ),
            GridColumn(
              columnName: "potSampah",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Potongan Sampah',
                ),
              ),
            ),
            GridColumn(
              columnName: "potTangkai",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Potongan Tangkai',
                ),
              ),
            ),
            GridColumn(
              columnName: "potPasir",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Potongan Pasir',
                ),
              ),
            ),
            GridColumn(
              columnName: "potMutu",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Potongan Mutu',
                ),
              ),
            ),
            GridColumn(
              columnName: "potMengkal",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Potongan Mengkal',
                ),
              ),
            ),
            GridColumn(
              columnName: "potLain",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Potongan Lain-lain',
                ),
              ),
            ),
            GridColumn(
              columnName: "pulMentah",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Pulangan Mentah',
                ),
              ),
            ),
            GridColumn(
              columnName: "pulBusuk",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Pulangan Busuk',
                ),
              ),
            ),
            GridColumn(
              columnName: "pulKosong",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Pulangan Kosong',
                ),
              ),
            ),
            GridColumn(
              columnName: "pulLain",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Pulangan Lain-lain',
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
                  'Diubah Oleh',
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

    Widget pagination(LaporanDataSource laporanDataSource) {
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
        child: FutureBuilder(
            future: DataTimbanganKeluar().getDataTimbanganKeluar(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                laporan = snapshot.data;
                laporanDataSource = LaporanDataSource(laporan: laporan);
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
                                            buildDataGrid(laporanDataSource)),
                                    pagination(laporanDataSource),
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
