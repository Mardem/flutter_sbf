import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sbf/core/app.dart';
import 'package:flutter_sbf/core/di/inject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await startModules();
  runApp(const App());
}
