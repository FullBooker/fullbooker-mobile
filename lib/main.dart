import 'package:flutter/material.dart';
import 'package:fullbooker/core/environments.dart';
import 'package:fullbooker/features/auth/pages/login.dart';
import 'package:fullbooker/features/host/pages/summary.dart';
import 'package:google_fonts/google_fonts.dart';

Future setupEnvironment() async {
  const envString = String.fromEnvironment("ENV");
  FlavourType envFlavour = FlavourType.values.firstWhere(
      (value) => value.toString() == "FlavourType.$envString",
      orElse: () => FlavourType.development);
  var envBuilder = BuildEnvironment(envFlavour);
  await envBuilder.setEnv();
}

Future main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrintStack(stackTrace: details.stack);
  };
  WidgetsFlutterBinding.ensureInitialized();
  await setupEnvironment();
  runApp(const MyApp(getHomePage));
}

Widget getHomePage() {
  if (currentToken == null) return const Login();

  return const EventsSummary();
}

class MyApp extends StatelessWidget {
  final Widget Function() homePage;

  const MyApp(this.homePage, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fullbooker',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xfff55E00),
            primary: const Color(0xfff55E00)),
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: homePage(),
    );
  }
}
