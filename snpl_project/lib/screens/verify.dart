// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ConfirmPg extends StatefulWidget {
  const ConfirmPg({Key? key}) : super(key: key);

  @override
  State<ConfirmPg> createState() => _ConfirmPgState();
}

class _ConfirmPgState extends State<ConfirmPg> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 40,
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
