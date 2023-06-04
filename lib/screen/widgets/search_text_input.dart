// ignore_for_file: avoid_print

part of './widgets.dart';

class SearchInputText extends StatelessWidget {
  final FaIcon icon;
  final Map<String, String> dataList;
  final String title;
  final FocusNode focusNode;
  final TextEditingController controller;
  // final Function(String) suggestionTap;
  final Function(String) onSubmit;
  final bool canEdit;
  const SearchInputText(
      {super.key,
      required this.icon,
      required this.dataList,
      required this.title,
      required this.focusNode,
      required this.controller,
      // required this.suggestionTap,
      required this.onSubmit,
      required this.canEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: SearchField(
        enabled: canEdit,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Field tidak boleh kosong";
          }
          return null;
        },
        onSubmit: (value) {
          final filter = dataList.entries
              .where((element) =>
                  element.value.toLowerCase() == value.toLowerCase())
              .toList();
          for (var element in filter) {
            value = element.value;
          }
          onSubmit(value);
        },
        suggestionState: Suggestion.expand,
        textInputAction: TextInputAction.next,
        marginColor: cGrey.withOpacity(0.5),
        focusNode: focusNode,
        onSuggestionTap: (SearchFieldListItem<String> x) {
          // String myKey = x.key.toString();
          // String extractedKey = myKey.substring(3, myKey.length - 3);
          // suggestionTap('id|$extractedKey');
          print("isi supplier controller: ${controller.text}");
          focusNode.unfocus();
        },
        searchStyle:
            blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
        searchInputDecoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14),
          isDense: true,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 18,
            minHeight: 18,
          ),
          prefixIcon:
              Container(margin: const EdgeInsets.only(right: 10), child: icon),
          errorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: cRed)),
          focusedErrorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: cBlue)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: cGrey)),
          hintText: "Pilih/Tuliskan $title",
          hintStyle: greyTextStyle.copyWith(fontSize: 12, fontWeight: light),
        ),
        suggestions: dataList.entries.map((MapEntry<String, String> entry) {
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
    );
  }
}
