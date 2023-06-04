// ignore_for_file: must_be_immutable, avoid_print

part of './widgets.dart';

class DialogSetupIndicator extends StatelessWidget {
  DialogSetupIndicator({super.key});

  TextEditingController portController = TextEditingController();
  TextEditingController baudRateController = TextEditingController();
  TextEditingController parityController = TextEditingController();
  TextEditingController dataBitsController = TextEditingController();
  TextEditingController stopBitsController = TextEditingController();
  final focusPort = FocusNode();
  final focusBaudRate = FocusNode();
  final focusParity = FocusNode();
  final focusDataBits = FocusNode();
  final focusStopBits = FocusNode();
  Map<String, String> dataPort = {
    'port1': 'port 1',
    'port2': 'port 2',
    'port3': 'port 3',
    'port4': 'port 4',
    'port5': 'port 5',
  };

  Map<String, String> dataBaudRate = {
    'baud1': '1200',
    'baud2': '4800',
    'baud3': '9600',
    'baud4': '19200',
  };

  Map<String, String> dataParity = {
    'parity1': 'Odd',
    'parity2': 'Even',
    'parity3': 'None',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.5,
      height: context.height * 0.7,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Serial Port",
            style: greyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SearchField(
            enabled: true,
            readOnly: true,
            controller: portController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Field tidak boleh kosong";
              }
              return null;
            },
            onSubmit: (value) {
              final filter = dataPort.entries
                  .where((element) =>
                      element.value.toLowerCase() == value.toLowerCase())
                  .toList();
              for (var element in filter) {
                value = element.value;
              }
              print("isi data submit: $value");
            },
            suggestionState: Suggestion.expand,
            textInputAction: TextInputAction.next,
            marginColor: cGrey.withOpacity(0.2),
            onSuggestionTap: (SearchFieldListItem<String> x) {
              print("isi port controller: ${portController.text}");
              focusPort.unfocus();
            },
            searchStyle:
                blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            searchInputDecoration: InputDecoration(
              suffixIconConstraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              suffixIcon: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.caretDown,
                    size: 18,
                    color: cGrey.withOpacity(0.5),
                  )),
              errorBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cRed)),
              focusedErrorBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cGrey)),
              hintText: "Pilih Port",
              hintStyle:
                  greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
            ),
            suggestions: dataPort.entries.map((MapEntry<String, String> entry) {
              var key = entry.key;
              var value = entry.value;
              return SearchFieldListItem<String>(value,
                  item: value,
                  key: Key(key),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              value,
                              style: blackTextStyle.copyWith(
                                  fontSize: 12, fontWeight: medium),
                            ),
                          ),
                        ],
                      )));
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Baud Rate",
            style: greyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SearchField(
            enabled: true,
            readOnly: true,
            controller: baudRateController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Field tidak boleh kosong";
              }
              return null;
            },
            onSubmit: (value) {
              final filter = dataBaudRate.entries
                  .where((element) =>
                      element.value.toLowerCase() == value.toLowerCase())
                  .toList();
              for (var element in filter) {
                value = element.value;
              }
              print("isi data submit: $value");
            },
            suggestionState: Suggestion.expand,
            textInputAction: TextInputAction.next,
            marginColor: cGrey.withOpacity(0.2),
            onSuggestionTap: (SearchFieldListItem<String> x) {
              print("isi baudrate controller: ${baudRateController.text}");
              focusBaudRate.unfocus();
            },
            searchStyle:
                blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            searchInputDecoration: InputDecoration(
              suffixIconConstraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              suffixIcon: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.caretDown,
                    size: 18,
                    color: cGrey.withOpacity(0.5),
                  )),
              errorBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cRed)),
              focusedErrorBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cGrey)),
              hintText: "Pilih Baud Rate",
              hintStyle:
                  greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
            ),
            suggestions:
                dataBaudRate.entries.map((MapEntry<String, String> entry) {
              var key = entry.key;
              var value = entry.value;
              return SearchFieldListItem<String>(value,
                  item: value,
                  key: Key(key),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              value,
                              style: blackTextStyle.copyWith(
                                  fontSize: 12, fontWeight: medium),
                            ),
                          ),
                        ],
                      )));
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Parity",
            style: greyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SearchField(
            enabled: true,
            readOnly: true,
            controller: parityController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Field tidak boleh kosong";
              }
              return null;
            },
            onSubmit: (value) {
              final filter = dataParity.entries
                  .where((element) =>
                      element.value.toLowerCase() == value.toLowerCase())
                  .toList();
              for (var element in filter) {
                value = element.value;
              }
              print("isi data submit: $value");
            },
            suggestionState: Suggestion.expand,
            textInputAction: TextInputAction.next,
            marginColor: cGrey.withOpacity(0.2),
            onSuggestionTap: (SearchFieldListItem<String> x) {
              print("isi parity controller: ${parityController.text}");
              focusParity.unfocus();
            },
            searchStyle:
                blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            searchInputDecoration: InputDecoration(
              suffixIconConstraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              suffixIcon: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: FaIcon(
                    FontAwesomeIcons.caretDown,
                    size: 18,
                    color: cGrey.withOpacity(0.5),
                  )),
              errorBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cRed)),
              focusedErrorBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cGrey)),
              hintText: "Pilih Parity",
              hintStyle:
                  greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
            ),
            suggestions:
                dataParity.entries.map((MapEntry<String, String> entry) {
              var key = entry.key;
              var value = entry.value;
              return SearchFieldListItem<String>(value,
                  item: value,
                  key: Key(key),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              value,
                              style: blackTextStyle.copyWith(
                                  fontSize: 12, fontWeight: medium),
                            ),
                          ),
                        ],
                      )));
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Data Bits",
            style: greyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          TextFormField(
            controller: dataBitsController,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              print("isi data bits: $value");
              focusDataBits.unfocus();
            },
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            decoration: InputDecoration(
              errorBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cRed)),
              focusedErrorBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cGrey)),
              hintText: "Input data bits",
              hintStyle:
                  greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Stop Bits",
            style: greyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          TextFormField(
            controller: stopBitsController,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              print("isi stopbits: $value");
              focusStopBits.unfocus();
            },
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            decoration: InputDecoration(
              errorBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cRed)),
              focusedErrorBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: cGrey)),
              hintText: "Input stop bits",
              hintStyle:
                  greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Container(
                    width: context.width * 0.1,
                    height: 35,
                    decoration: BoxDecoration(
                      color: cBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Container(
                    width: context.width * 0.1,
                    height: 35,
                    decoration: BoxDecoration(
                      color: cOrange.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Reset",
                        style: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
