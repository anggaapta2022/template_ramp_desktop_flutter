part of './widgets.dart';

class ButtonExport extends StatelessWidget {
  const ButtonExport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Container(
                width: context.width * 0.1,
                height: 40,
                decoration: BoxDecoration(
                  color: cGreen.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Export to Excel",
                      style: whiteTextStyle.copyWith(
                          fontSize: 12, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FaIcon(
                      FontAwesomeIcons.fileExcel,
                      size: 16,
                      color: cWhite,
                    )
                  ],
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
                height: 40,
                decoration: BoxDecoration(
                  color: cRed.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Export to PDF",
                      style: whiteTextStyle.copyWith(
                          fontSize: 12, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FaIcon(
                      FontAwesomeIcons.filePdf,
                      size: 16,
                      color: cWhite,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
