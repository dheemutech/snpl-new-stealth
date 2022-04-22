// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);
  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff271D5F),
      body: Center(
        child: SpinKitPouringHourGlass(
          size: 80,
          duration: Duration(seconds: 5),
          color: Color(0xffFF9838),
        ),
      ),
    );
  }
}
