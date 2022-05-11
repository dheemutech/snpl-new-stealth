// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Scan extends StatefulWidget {
  const Scan({ Key? key }) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}