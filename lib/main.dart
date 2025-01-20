import 'package:flutter/material.dart';
import 'package:fullbooker/core/environments.dart';
import 'package:fullbooker/shared/pages/landing.dart';

Future setupEnvironment() async {
  const envString = String.fromEnvironment("ENV");
  FlavourType envFalvour = FlavourType.values.firstWhere(
      (value) => value.toString() == "FlavourType.$envString",
      orElse: () => FlavourType.development);
  var envBuilder = BuildEnvironment(envFalvour);
  await envBuilder.setEnv();
}

Future main() async {
  runApp(const MyApp());
  await setupEnvironment();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xfff55E00),
            primary: const Color(0xfff55E00)),
        useMaterial3: true,
        fontFamily: "Open Sans",
      ),
      home: const LandingPage(),
    );
  }
}
