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
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitPouringHourGlass(
          size: 60,
          duration: Duration(seconds: 5),
          color: Colors.black,
        ),
      ),
    );
  }
}
