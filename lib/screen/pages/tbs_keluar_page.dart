// ignore_for_file: avoid_print

part of './pages.dart';

class TBSKeluarPage extends StatefulWidget {
  final String idSelected;
  const TBSKeluarPage({super.key, this.idSelected = ""});

  @override
  State<TBSKeluarPage> createState() => _TBSKeluarPageState();
}

class _TBSKeluarPageState extends State<TBSKeluarPage> {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool inputManual = false;
  String dateNow = DateFormat('dd MMM yyyy').format(DateTime.now());
  List<TimbanganMasukModel> dataTimbangan = <TimbanganMasukModel>[];
  String receivedData = "";
  String isConnect = "Konek Timbangan";
  late SerialPort port;

  Future getValuePreferences() async {
    var indikatorProvider =
        Provider.of<IndikatorProvider>(context, listen: false);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    indikatorProvider.devicePort = preferences.getString("port") == ""
        ? ""
        : preferences.getString("port")!;
    indikatorProvider.baudRate = preferences.getString("baudRate") == ""
        ? ""
        : preferences.getString("baudRate")!;
    indikatorProvider.parity = preferences.getString("parity") == ""
        ? ""
        : preferences.getString("parity")!;
    indikatorProvider.dataBits = preferences.getString("dataBits") == ""
        ? ""
        : preferences.getString("dataBits")!;
    indikatorProvider.stopBits = preferences.getString("stopBits") == ""
        ? ""
        : preferences.getString("stopBits")!;
  }

  openAndGetData() {
    var indikatorProvider =
        Provider.of<IndikatorProvider>(context, listen: false);
    port = SerialPort(indikatorProvider.devicePort,
        BaudRate: int.parse(indikatorProvider.baudRate),
        StopBits: int.parse(indikatorProvider.stopBits),
        openNow: false,
        Parity: indikatorProvider.parity == "None"
            ? 0
            : indikatorProvider.parity == "Odd"
                ? 1
                : 2,
        ByteSize: int.parse(indikatorProvider.dataBits),
        ReadIntervalTimeout: 1,
        ReadTotalTimeoutConstant: 2);
    port.open();
    print("status port: ${port.isOpened}");
    String msg = "";
    port.readBytesOnListen(16, (value) {
      String decodedString = ascii.decode(value);
      String replacedString =
          decodedString.replaceAll(RegExp('[\x02\x03]'), '|');

      if (replacedString != "+" && replacedString.isNotEmpty) {
        if (msg.length == 9) {
          if (mounted) {
            String msgFinal = msg;
            setState(() {
              receivedData = msgFinal.replaceAll('|', '').substring(0, 6);
            });
          }
        } else if (replacedString == "|" && msg.length > 10) {
          msg = "";
        }
        msg += replacedString;
      }
      print("isi data: $receivedData");
    });
  }

  closePort() {
    var indikatorProvider =
        Provider.of<IndikatorProvider>(context, listen: false);
    port = SerialPort(indikatorProvider.devicePort,
        BaudRate: int.parse(indikatorProvider.baudRate),
        StopBits: int.parse(indikatorProvider.stopBits),
        openNow: false,
        Parity: indikatorProvider.parity == "None"
            ? 0
            : indikatorProvider.parity == "Odd"
                ? 1
                : 2,
        ByteSize: int.parse(indikatorProvider.dataBits),
        ReadIntervalTimeout: 1,
        ReadTotalTimeoutConstant: 2);
    port.close();
    print("status port: ${port.isOpened}");
  }

  @override
  void initState() {
    super.initState();
    getValuePreferences();
    print("isi idSelected: ${widget.idSelected}");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var globalProvider = Provider.of<GlobalProvider>(context);
    var timKeluarProvider = Provider.of<TimbanganKeluarProvider>(context);
    Widget sectionIformationTimbangMasuk() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: FutureBuilder(
            future: DataTimbanganMasuk()
                .getDataTimbanganMasukById(widget.idSelected),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                Timer(const Duration(seconds: 2), () {
                  if (mounted) {
                    setState(() {
                      dataTimbangan = snapshot.data;
                      // print("isi dataTimbangan: $dataTimbangan");
                    });
                  }
                });
              }
              return !snapshot.hasData
                  ? Center(
                      child: CircularProgressIndicator(color: cBlue),
                    )
                  : dataTimbangan.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: cBlue,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Informasi Timbangan Masuk",
                              style: greyTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Supplier",
                              style: greyTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              dataTimbangan[0].supplier,
                              style: blackTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No. Polisi",
                              style: greyTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              dataTimbangan[0].nopol,
                              style: blackTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Supir",
                              style: greyTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              dataTimbangan[0].supir,
                              style: blackTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Nama Barang",
                              style: greyTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              dataTimbangan[0].namaBarang,
                              style: blackTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Id Laporan Masuk",
                              style: greyTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.idSelected,
                              style: blackTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            )
                          ],
                        );
            }),
      );
    }

    Widget sectionTara() {
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
                        "Berat Tara: ",
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: semiBold),
                      ),
                      Text(
                        "${receivedData == "" ? "0000000" : receivedData} kg",
                        style: customTextStyle.copyWith(
                            fontSize: 24, fontWeight: bold, color: cBlue),
                      ),
                    ],
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: isConnect != "Konek Timbangan"
                        ? () {
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                backgroundColor: cTransparent,
                                alignment: Alignment.center,
                                shadowColor: cBlack.withOpacity(0.5),
                                child: const UnPlug(),
                              ),
                            );
                            setState(() {
                              closePort();
                              isConnect = "Konek Timbangan";
                              receivedData = "";
                            });
                          }
                        : () {
                            setState(() {
                              openAndGetData();
                              isConnect = "Putuskan Koneksi";
                            });
                          },
                    child: Container(
                      width: context.width * 0.12,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isConnect != "Konek Timbangan"
                            ? cRed.withOpacity(0.5)
                            : cGreen.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          isConnect,
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
                    controller: timKeluarProvider.inputManualController,
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
            Text(
              "Potongan Percent",
              style: greyTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
            ),
            TextFormField(
              controller: timKeluarProvider.potonganPercentController,
              keyboardType: TextInputType.number,
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
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
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide(color: cGrey)),
                hintText: "potongan percent",
                hintStyle:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: light),
              ),
            ),
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
                  timKeluarProvider.idLaporanKeluar,
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
                  "Waktu Keluar:",
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
        margin: const EdgeInsets.only(top: 30, bottom: 20),
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
                        child: DialogKonfirmasiTBSKeluar(
                          idLaporanKeluar: timKeluarProvider.idLaporanKeluar,
                          namaSupplier: dataTimbangan[0].supplier,
                          noPolisi: dataTimbangan[0].nopol,
                          namaSupir: dataTimbangan[0].supir,
                          namaBarang: dataTimbangan[0].namaBarang,
                          idLaporanMasuk: dataTimbangan[0].idLaporan,
                          bruto: dataTimbangan[0].bruto.toString(),
                          manualBruto: dataTimbangan[0].manualBruto.toString(),
                          tara: receivedData.replaceFirst(RegExp('^0+'), ''),
                          manualTara:
                              timKeluarProvider.inputManualController.text,
                          potPercent:
                              timKeluarProvider.potonganPercentController.text,
                          netto: "0",
                          beratTandan:
                              timKeluarProvider.beratTandanController.text,
                          jumlahTandan:
                              timKeluarProvider.jumlahTandanController.text,
                          potAir: timKeluarProvider.airController.text,
                          potSampah: timKeluarProvider.sampahController.text,
                          potTangkai: timKeluarProvider.tangkaiController.text,
                          potPasir: timKeluarProvider.pasirController.text,
                          potMutu: timKeluarProvider.mutuController.text,
                          potMengkal: timKeluarProvider.mengkalController.text,
                          potLain:
                              timKeluarProvider.potonganLainController.text,
                          pulMentah: timKeluarProvider.mentahController.text,
                          pulBusuk: timKeluarProvider.busukController.text,
                          pulKosong: timKeluarProvider.kosongController.text,
                          pulLain:
                              timKeluarProvider.pulanganLainController.text,
                          jamMasuk: dataTimbangan[0].jamMasuk,
                        ),
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
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    timKeluarProvider.inputManualController.text = "";
                    timKeluarProvider.potonganPercentController.text = "";
                    timKeluarProvider.beratTandanController.text = "";
                    timKeluarProvider.jumlahTandanController.text = "";
                    timKeluarProvider.airController.text = "";
                    timKeluarProvider.sampahController.text = "";
                    timKeluarProvider.tangkaiController.text = "";
                    timKeluarProvider.pasirController.text = "";
                    timKeluarProvider.mutuController.text = "";
                    timKeluarProvider.mengkalController.text = "";
                    timKeluarProvider.potonganLainController.text = "";
                    timKeluarProvider.mentahController.text = "";
                    timKeluarProvider.busukController.text = "";
                    timKeluarProvider.kosongController.text = "";
                    timKeluarProvider.pulanganLainController.text = "";
                  },
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
            ),
          ],
        ),
      );
    }

    Widget sectionRightTopText() {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            "PT Pujud Karya Sawit",
            style: blackTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
          ),
        ),
      );
    }

    Widget sectionRightInformation() {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: dataTimbangan.isEmpty
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              color: cBlue,
                            ),
                          ),
                        )
                      : Text(
                          "Supplier: ${dataTimbangan[0].supplier}",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jam Masuk:",
                      style: greyTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                    Text(
                      "14:00:00",
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jam Keluar:",
                      style: greyTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                    RunningTime(
                        fontSize: 14, fontWeight: semiBold, color: cBlack),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal:",
                      style: greyTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                    Text(
                      dateNow,
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: context.width * 1,
              height: 2,
              decoration: BoxDecoration(
                color: cGrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      );
    }

    Widget sectionRightInput() {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: context.height * 0.65,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: cWhite,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: cBlack.withOpacity(0.25),
                      offset: const Offset(2.0, 2.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: dataTimbangan.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: cBlue,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.truckFront,
                                size: 18,
                                color: cBlue,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  dataTimbangan[0].nopol,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 14, fontWeight: medium),
                                ),
                              ),
                              Text(
                                dataTimbangan[0].namaBarang,
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Berat Bruto:",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                                Text("${dataTimbangan[0].bruto} kg",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Manual Bruto:",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                                Text("${dataTimbangan[0].manualBruto} kg",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Berat Tara:",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                                Text("0 kg",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Manual Tara:",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                                Text("0 kg",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Berat Netto:",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                                Text("0 kg",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Potongan (0.0 %):",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                                Text("0 kg",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 14, fontWeight: medium)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Berat Tandan",
                              style: blackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium)),
                          TextFormField(
                            controller: timKeluarProvider.beratTandanController,
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
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
                              hintText: "0",
                              hintStyle: greyTextStyle.copyWith(
                                  fontSize: 14, fontWeight: light),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("Jumlah Tandan",
                              style: blackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium)),
                          TextFormField(
                            controller:
                                timKeluarProvider.jumlahTandanController,
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
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
                              hintText: "0",
                              hintStyle: greyTextStyle.copyWith(
                                  fontSize: 14, fontWeight: light),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            SizedBox(
              width: context.width * 0.010,
            ),
            Expanded(
              child: Container(
                height: context.height * 0.65,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: cWhite,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: cBlack.withOpacity(0.25),
                      offset: const Offset(2.0, 2.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.scissors,
                            size: 18,
                            color: cBlue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              "Potongan",
                              style: blackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Air",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      TextFormField(
                        controller: timKeluarProvider.airController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
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
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cBlue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cGrey)),
                          hintText: "0",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Sampah",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      TextFormField(
                        controller: timKeluarProvider.sampahController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
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
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cBlue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cGrey)),
                          hintText: "0",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Tangkai",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      TextFormField(
                        controller: timKeluarProvider.tangkaiController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
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
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cBlue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cGrey)),
                          hintText: "0",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Pasir",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      TextFormField(
                        controller: timKeluarProvider.pasirController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
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
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cBlue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cGrey)),
                          hintText: "0",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Mutu",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      TextFormField(
                        controller: timKeluarProvider.mutuController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
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
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cBlue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cGrey)),
                          hintText: "0",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Mengkal",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      TextFormField(
                        controller: timKeluarProvider.mengkalController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
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
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cBlue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cGrey)),
                          hintText: "0",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Lain-lain",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      TextFormField(
                        controller: timKeluarProvider.potonganLainController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
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
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cBlue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cGrey)),
                          hintText: "0",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: context.width * 0.010,
            ),
            Expanded(
              child: Container(
                height: context.height * 0.65,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: cWhite,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: cBlack.withOpacity(0.25),
                      offset: const Offset(2.0, 2.0), //(x,y)
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.houseFlag,
                            size: 18,
                            color: cBlue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              "Pulangan",
                              style: blackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Mentah",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      TextFormField(
                        controller: timKeluarProvider.mentahController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
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
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cBlue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cGrey)),
                          hintText: "0",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Busuk",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      TextFormField(
                        controller: timKeluarProvider.busukController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
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
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cBlue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cGrey)),
                          hintText: "0",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Kosong",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      TextFormField(
                        controller: timKeluarProvider.kosongController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
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
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cBlue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cGrey)),
                          hintText: "0",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Lain-lain",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)),
                      TextFormField(
                        controller: timKeluarProvider.pulanganLainController,
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
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
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cBlue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cGrey)),
                          hintText: "0",
                          hintStyle: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return widget.idSelected.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: lottie.Lottie.asset("assets/empty.json"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Anda belum memilih data Timbangan Masuk",
                style:
                    greyTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 20,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    DefaultTabController.of(context).animateTo(0);
                  },
                  child: Text(
                    "Kembali",
                    style: customTextStyle.copyWith(
                        fontSize: 16, fontWeight: bold, color: cOrange),
                  ),
                ),
              )
            ],
          )
        : globalProvider.loading
            ? Center(
                child: CircularProgressIndicator(
                  color: cBlue,
                ),
              )
            : Row(
                children: [
                  Container(
                    width: context.width * 0.3,
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: formKey,
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sectionIformationTimbangMasuk(),
                              sectionTara(),
                              buttonSubmit(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionRightTopText(),
                        sectionRightInformation(),
                        Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: formKey2,
                            child: sectionRightInput()),
                      ],
                    ),
                  )),
                ],
              );
  }
}
