part of './widgets.dart';

class RunningTime extends StatefulWidget {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  const RunningTime(
      {super.key,
      required this.fontSize,
      required this.fontWeight,
      required this.color});

  @override
  State<RunningTime> createState() => _RunningTimeState();
}

class _RunningTimeState extends State<RunningTime>
    with TickerProviderStateMixin {
  String timeString = "";
  late Timer timer;

  void getTime() {
    final DateTime dateNow = DateTime.now();
    final String formattedDateTime =
        DateFormat('HH:mm:ss', 'id_ID').format(dateNow);
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
    timeString = DateFormat('hh:mm:ss').format(DateTime.now());
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
