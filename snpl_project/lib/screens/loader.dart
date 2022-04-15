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
        child: SpinKitThreeInOut(
          size: 100,
          duration: Duration(seconds: 20),
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index.isEven ? Colors.green : Colors.red));
          },
        ),
      ),
    );
  }
}
