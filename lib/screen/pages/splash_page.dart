part of './pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  @override
  void initState() {
    super.initState();
    ConnectivityUtil.checkConnectivity(context);
    Timer(const Duration(seconds: 3), () {
      context.pushAndRemoveUntil(MainPage(
        controller: _controller,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 61,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/logo.png"))),
        ),
      ),
    );
  }
}
