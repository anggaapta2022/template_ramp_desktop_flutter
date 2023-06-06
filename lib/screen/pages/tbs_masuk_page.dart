// ignore_for_file: avoid_print, use_build_context_synchronously

part of './pages.dart';

class TBSMasukPage extends StatefulWidget {
  const TBSMasukPage({super.key});

  @override
  State<TBSMasukPage> createState() => _TBSMasukPageState();
}

class _TBSMasukPageState extends State<TBSMasukPage> {
  final focusSupplier = FocusNode();
  final focusNopol = FocusNode();
  final focusSupir = FocusNode();
  final focusBarang = FocusNode();
  Map<String, String> dataSupplier = {
    'supplier1': 'PT Supplier 1',
    'supplier2': 'PT Supplier 2',
    'supplier3': 'PT Supplier 3',
    'supplier4': 'PT Supplier 4',
    'supplier5': 'PT Supplier 5',
  };
  Map<String, String> dataNopol = {
    'nopol1': 'BM 1234 AEK',
    'nopol2': 'BM 4321 KEA',
    'nopol3': 'BM 1357 CUY',
    'nopol4': 'BM 7531 YUC',
    'nopol5': 'BM 2468 AHH',
    'nopol6': 'BM 4321 KEA',
    'nopol7': 'BM 1357 CUY',
    'nopol8': 'BM 7531 YUC',
    'nopol9': 'BM 2468 AHH',
    'nopol10': 'BM 4321 KEA',
    'nopol11': 'BM 1357 CUY',
    'nopol12': 'BM 7531 YUC',
    'nopol13': 'BM 2468 AHH',
  };
  Map<String, String> dataSupir = {
    'supir1': 'Supir 1',
    'supir2': 'Supir 2',
    'supir3': 'Supir 3',
    'supir4': 'Supir 4',
    'supir5': 'Supir 5',
  };
  Map<String, String> dataBarang = {
    'barang1': 'CPO',
    'barang2': 'TBS',
    'barang3': 'Barang 3',
    'barang4': 'Barang 4',
    'barang5': 'Barang 5',
  };
  bool inputManual = false;
  String dateNow = DateFormat('dd/MM/yy').format(DateTime.now());
  final formKey = GlobalKey<FormState>();
  final GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();
  List<TimbanganMasukModel> timbanganMasuk = <TimbanganMasukModel>[];
  DataTimbanganMasuk dataTimbanganMasuk = DataTimbanganMasuk();
  late TimbanganMasukDataSource timbanganMasukDataSource;

  final int rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);
    Widget sectionInput() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchInputText(
              icon: FaIcon(
                FontAwesomeIcons.truckFast,
                size: 16,
                color: cGrey.withOpacity(0.4),
              ),
              dataList: dataSupplier,
              title: "Supplier",
              focusNode: focusSupplier,
              controller: globalProvider.supplierController,
              onSubmit: (data) {
                print("isi data submit: $data");
              },
              canEdit: true,
            ),
            SearchInputText(
              icon: FaIcon(
                FontAwesomeIcons.rug,
                size: 16,
                color: cGrey.withOpacity(0.4),
              ),
              dataList: dataNopol,
              title: "No. Polisi",
              focusNode: focusNopol,
              controller: globalProvider.nopolController,
              onSubmit: (data) {
                print("isi data submit: $data");
              },
              canEdit: true,
            ),
            SearchInputText(
              icon: FaIcon(
                FontAwesomeIcons.personChalkboard,
                size: 16,
                color: cGrey.withOpacity(0.4),
              ),
              dataList: dataSupir,
              title: "Supir",
              focusNode: focusSupir,
              controller: globalProvider.supirController,
              onSubmit: (data) {
                print("isi data submit: $data");
              },
              canEdit: true,
            ),
            SearchInputText(
              icon: FaIcon(
                FontAwesomeIcons.truckRampBox,
                size: 16,
                color: cGrey.withOpacity(0.4),
              ),
              dataList: dataBarang,
              title: "Barang",
              focusNode: focusBarang,
              controller: globalProvider.barangController,
              onSubmit: (data) {
                print("isi data submit: $data");
              },
              canEdit: true,
            ),
          ],
        ),
      );
    }

    Widget sectionBruto() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Berat Bruto: ",
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: semiBold),
                      ),
                      Text(
                        "0000 kg",
                        style: customTextStyle.copyWith(
                            fontSize: 24, fontWeight: bold, color: cBlue),
                      ),
                    ],
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      width: context.width * 0.12,
                      height: 40,
                      decoration: BoxDecoration(
                        color: cGreen.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Konek Timbangan",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Input Berat secara Manual?",
                    style: greyTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        inputManual = !inputManual;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: inputManual ? cBlue : null,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: inputManual ? cBlue : cGrey.withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                      child: inputManual
                          ? Center(
                              child: FaIcon(
                                FontAwesomeIcons.check,
                                size: 14,
                                color: cWhite,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            inputManual
                ? TextFormField(
                    controller: globalProvider.inputManualController,
                    keyboardType: TextInputType.number,
                    style:
                        blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field tidak boleh kosong";
                      }
                      return null;
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: cBlue)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: cGrey)),
                      hintText: "input manual",
                      hintStyle: greyTextStyle.copyWith(
                          fontSize: 14, fontWeight: light),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "No. Faktur:",
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  globalProvider.idLaporan,
                  style: customTextStyle.copyWith(
                      fontSize: 16, fontWeight: bold, color: cBlue),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Waktu Masuk:",
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  width: 5,
                ),
                RunningDateTime(fontSize: 16, fontWeight: bold, color: cBlue),
              ],
            ),
          ],
        ),
      );
    }

    Widget buttonSubmit() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        backgroundColor: cTransparent,
                        alignment: Alignment.center,
                        shadowColor: cBlack.withOpacity(0.5),
                        child: DialogKonfirmasiTBSMasuk(
                            supplier: globalProvider.supplierController.text,
                            nopol: globalProvider.nopolController.text,
                            supir: globalProvider.supirController.text,
                            namaBarang: globalProvider.barangController.text,
                            bruto: "0",
                            manualBruto:
                                globalProvider.inputManualController.text,
                            idLaporan: globalProvider.idLaporan,
                            jamMasuk: DateFormat('yyyy-MM-dd HH:mm:ss')
                                .format(DateTime.now())),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cBlue,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: whiteTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: cOrange.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(
                      "Reset",
                      style: whiteTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildDataGrid(TimbanganMasukDataSource timbanganMasukDataSource) {
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
          source: timbanganMasukDataSource,
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
              columnName: "action",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text(
                  '',
                ),
              ),
            ),
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
                  'Supplier',
                ),
              ),
            ),
            GridColumn(
              columnName: "supir",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Supir',
                ),
              ),
            ),
            GridColumn(
              columnName: "nopol",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'No.Polisi',
                ),
              ),
            ),
            GridColumn(
              columnName: "barang",
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Barang',
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
                  'Konfirmasi Bruto',
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget pagination(TimbanganMasukDataSource timbanganMasukDataSource) {
      return SfDataPager(
          pageCount: timbanganMasuk.length / rowsPerPage,
          delegate: timbanganMasukDataSource);
    }

    return globalProvider.loading
        ? Center(
            child: CircularProgressIndicator(color: cBlue),
          )
        : Row(
            children: [
              Container(
                width: context.width * 0.3,
                margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionInput(),
                      sectionBruto(),
                      buttonSubmit(),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
                child: FutureBuilder(
                    future: DataTimbanganMasuk().getDataTimbanganMasuk(),
                    builder: (context, snapshot) {
                      print("isi data: ${snapshot.data}");
                      if (snapshot.data != null) {
                        timbanganMasuk = snapshot.data;
                        timbanganMasukDataSource = TimbanganMasukDataSource(
                            timbanganMasuk: timbanganMasuk,
                            buildContext: context);
                      }
                      return !snapshot.hasData
                          ? Center(
                              child: CircularProgressIndicator(
                                color: cBlue,
                              ),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: context.height * 0.6,
                                                child: buildDataGrid(
                                                    timbanganMasukDataSource)),
                                            pagination(
                                                timbanganMasukDataSource),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                );
                    }),
              )),
            ],
          );
  }
}
