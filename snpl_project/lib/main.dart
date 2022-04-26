// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_flurry_sdk/flurry.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';
import 'package:snpl_project/screen1/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   Flurry.builder
    .withCrashReporting(true)
    .withLogEnabled(true)
    .withLogLevel(LogLevel.debug)
    .build(
        androidAPIKey: "XRR74QJ6BFN8TRFK6WN7");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterUxcam.optIntoSchematicRecordings();
    FlutterUxcam.startWithKey("4nzo9i0qafqjtog");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      
    );
  }
}
