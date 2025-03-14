import 'package:flutter/material.dart';
import 'package:fullbooker/core/utils.dart';
import 'package:fullbooker/my_app_widget.dart';

Future<void> main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrintStack(stackTrace: details.stack);
  };
  WidgetsFlutterBinding.ensureInitialized();
  await setupEnvironment();
  runApp(const MyAppWidget());
}
