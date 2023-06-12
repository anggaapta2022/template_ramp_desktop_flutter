// ignore_for_file: avoid_print

part of './pages.dart';

class IndikatorPage extends StatefulWidget {
  const IndikatorPage({super.key});

  @override
  State<IndikatorPage> createState() => _IndikatorPageState();
}

class _IndikatorPageState extends State<IndikatorPage> {
  String resultIndicator = "";
  String receivedData = "";
  String buttonConnect = "OPEN";
  late SerialPort port;

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
    setState(() {
      buttonConnect = "CLOSE";
    });
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
    setState(() {
      buttonConnect = "OPEN";
    });
    print("status port: ${port.isOpened}");
  }

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

  @override
  void initState() {
    super.initState();
    getValuePreferences();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var indikatorProvider = Provider.of<IndikatorProvider>(context);
    Widget sectionInformationIndicator() {
      return Expanded(
        child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Information Indicator",
                    style: greyTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                              backgroundColor: cTransparent,
                              alignment: Alignment.center,
                              shadowColor: cBlack.withOpacity(0.5),
                              child: const DialogSetupIndicator()),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                          color: cBlue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "Edit Indikator",
                            style: whiteTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Device: ",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Baud Rate: ",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Parity: ",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Data Bits: ",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Stop Bits: ",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Data Format: ",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          indikatorProvider.devicePort,
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          indikatorProvider.baudRate,
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          indikatorProvider.parity,
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          indikatorProvider.dataBits,
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          indikatorProvider.stopBits,
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "ASCII",
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget sectionOperation() {
      return Expanded(
        child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Status Indikator",
                          style: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: buttonConnect != "OPEN"
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
                                      resultIndicator = "CLOSE";
                                      receivedData = "";
                                    });
                                  }
                                : () {
                                    setState(() {
                                      openAndGetData();
                                      resultIndicator = "OPEN";
                                    });
                                  },
                            child: Container(
                              width: 100,
                              height: 35,
                              margin: const EdgeInsets.only(bottom: 25),
                              decoration: BoxDecoration(
                                color: buttonConnect != "OPEN"
                                    ? cRed.withOpacity(0.7)
                                    : cBlue.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  buttonConnect,
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 14, fontWeight: bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Result",
                        style: greyTextStyle.copyWith(
                            fontSize: 20, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        resultIndicator,
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: bold),
                      )
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      );
    }

    Widget sectionReceivedData() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Received Data",
              style: greyTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 25,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: receivedData == "" ? "0000000" : receivedData,
                style: customTextStyle.copyWith(
                    fontSize: 28, fontWeight: semiBold, color: cBlue),
              ),
              TextSpan(
                text: " kg",
                style:
                    blackTextStyle.copyWith(fontSize: 28, fontWeight: medium),
              ),
            ]))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halaman Indikator",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionInformationIndicator(),
                const SizedBox(
                  width: 20,
                ),
                sectionOperation(),
              ],
            ),
            sectionReceivedData(),
          ],
        ),
      ),
    );
  }
}
