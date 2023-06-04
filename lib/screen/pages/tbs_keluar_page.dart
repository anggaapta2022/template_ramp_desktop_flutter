part of './pages.dart';

class TBSKeluarPage extends StatefulWidget {
  final String idSelected;
  const TBSKeluarPage({super.key, this.idSelected = ""});

  @override
  State<TBSKeluarPage> createState() => _TBSKeluarPageState();
}

class _TBSKeluarPageState extends State<TBSKeluarPage> {
  TextEditingController inputManualController = TextEditingController();
  TextEditingController potonganPercentController = TextEditingController();
  TextEditingController beratTandanController = TextEditingController();
  TextEditingController jumlahTandanController = TextEditingController();
  TextEditingController airController = TextEditingController();
  TextEditingController sampahController = TextEditingController();
  TextEditingController tangkaiController = TextEditingController();
  TextEditingController pasirController = TextEditingController();
  TextEditingController mutuController = TextEditingController();
  TextEditingController mengkalController = TextEditingController();
  TextEditingController potonganLainController = TextEditingController();
  TextEditingController mentahController = TextEditingController();
  TextEditingController busukController = TextEditingController();
  TextEditingController kosongController = TextEditingController();
  TextEditingController pulanganLainController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool inputManual = false;
  String dateNow = DateFormat('dd MMM yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    Widget sectionIformationTimbangMasuk() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Informasi Timbangan Masuk",
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Supplier",
              style: greyTextStyle.copyWith(fontSize: 14, fontWeight: medium),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Supplier 1",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "No. Polisi",
              style: greyTextStyle.copyWith(fontSize: 14, fontWeight: medium),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "BM 1234 ENK",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Supir",
              style: greyTextStyle.copyWith(fontSize: 14, fontWeight: medium),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Supir 1",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Barang",
              style: greyTextStyle.copyWith(fontSize: 14, fontWeight: medium),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "TBS",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ],
        ),
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
                    controller: inputManualController,
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
              controller: potonganPercentController,
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
                  widget.idSelected,
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
                        child: const DialogKonfirmasiTBSKeluar(),
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
                  child: Text(
                    "Supplier: Supplier 1",
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
                child: Column(
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
                            "BM 1234 ENK",
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: medium),
                          ),
                        ),
                        Text(
                          "TBS",
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
                          Text("0.0 kg",
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
                          Text("7000.0 kg",
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
                          Text("0.0 kg",
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
                          Text("0.0 kg",
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
                          Text("0.0 kg",
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
                          Text("0.0 kg",
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
                          Text("Berat Terima:",
                              style: blackTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium)),
                          Text("0.0 kg",
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
                      controller: beratTandanController,
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
                      controller: jumlahTandanController,
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
                        controller: airController,
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
                        controller: sampahController,
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
                        controller: tangkaiController,
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
                        controller: pasirController,
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
                        controller: mutuController,
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
                        controller: mengkalController,
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
                        controller: potonganLainController,
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
                        controller: mentahController,
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
                        controller: busukController,
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
                        controller: kosongController,
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
                        controller: pulanganLainController,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: formKey2,
                        child: sectionRightInput()),
                  ],
                ),
              )),
            ],
          );
  }
}
