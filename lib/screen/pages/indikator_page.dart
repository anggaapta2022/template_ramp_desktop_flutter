part of './pages.dart';

class IndikatorPage extends StatefulWidget {
  const IndikatorPage({super.key});

  @override
  State<IndikatorPage> createState() => _IndikatorPageState();
}

class _IndikatorPageState extends State<IndikatorPage> {
  String resultIndicator = "";
  @override
  Widget build(BuildContext context) {
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
                              child: DialogSetupIndicator()),
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
                          "COM4",
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "1200",
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Even",
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "7",
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "1",
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
                            onTap: () {
                              setState(() {
                                resultIndicator = "OPEN";
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 35,
                              margin: const EdgeInsets.only(bottom: 25),
                              decoration: BoxDecoration(
                                color: cBlue.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "OPEN",
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 14, fontWeight: bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                resultIndicator = "CLOSE";
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 35,
                              margin: const EdgeInsets.only(bottom: 25),
                              decoration: BoxDecoration(
                                color: cOrange.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "CLOSE",
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 14, fontWeight: bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                resultIndicator = "";
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 35,
                              margin: const EdgeInsets.only(bottom: 25),
                              decoration: BoxDecoration(
                                color: cRed.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "EMPTY",
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
                text: "0000",
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
