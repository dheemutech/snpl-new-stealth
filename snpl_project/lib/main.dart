// ignore_for_file: prefer_const_constructors

import 'package:amplitude_flutter/amplitude.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_flurry_sdk/flurry.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';
import 'package:snpl_project/screen1/firstpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Flurry.builder
      .withCrashReporting(true)
      .withLogEnabled(true)
      .withLogLevel(LogLevel.debug)
      .build(androidAPIKey: "XRR74QJ6BFN8TRFK6WN7");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterUxcam.optIntoSchematicRecordings();
    FlutterUxcam.startWithKey("41kxrerao7psfio");
    Amplitude.getInstance().init("43236ebd8f8fc3b45ca1dd2cace2ee22");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loading(),
    );
  }
}
