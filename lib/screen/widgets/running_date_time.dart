part of './widgets.dart';

class RunningDateTime extends StatefulWidget {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  const RunningDateTime(
      {super.key,
      required this.fontSize,
      required this.fontWeight,
      required this.color});

  @override
  State<RunningDateTime> createState() => _RunningDateTimeState();
}

class _RunningDateTimeState extends State<RunningDateTime>
    with TickerProviderStateMixin {
  String timeString = "";
  late Timer timer;

  void getTime() {
    final DateTime dateNow = DateTime.now();
    final String formattedDateTime =
        DateFormat('dd MMMM yyyy HH:mm:ss', 'id_ID').format(dateNow);
    setState(() {
      timeString = formattedDateTime;
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getTime();
    });
  }

  @override
  void initState() {
    super.initState();
    timeString = DateFormat('dd MMMM yyyy hh:mm:ss').format(DateTime.now());
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      timeString,
      style: customTextStyle.copyWith(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: widget.color),
    );
  }
}
