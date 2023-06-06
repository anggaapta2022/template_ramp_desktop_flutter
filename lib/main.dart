import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:ramp_desktop/screen/pages/pages.dart';
import 'package:ramp_desktop/services/page_provider.dart';
import 'package:ramp_desktop/services/timbangan_masuk_provider.dart';
import 'package:ramp_desktop/shared/theme.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'services/global_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(const MyApp()));
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1560, 866);
    win.minSize = initialSize;
    win.maxSize = const Size(1910, 1080);
    win.size = initialSize;
    win.title = "Ramp Desktop";
    win.alignment = Alignment.center;
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalProvider>(
            create: (context) => GlobalProvider()),
        ChangeNotifierProvider<PageProvider>(
            create: (context) => PageProvider()),
        ChangeNotifierProvider<TimbanganMasukProvider>(
            create: (context) => TimbanganMasukProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: cWhite,
          useMaterial3: true,
          appBarTheme: AppBarTheme(color: cWhite),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
